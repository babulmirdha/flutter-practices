import 'package:flutter/material.dart';
import 'package:hive_example/EditTravelPage.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'ShowTravelPage.dart';
import 'Travel.dart'; // Adjust the import to the correct path
import 'CreateTravelPage.dart'; // Adjust the import to the correct path

class TravelListWithCRUDPage extends StatefulWidget {
  const TravelListWithCRUDPage({super.key});

  @override
  State<TravelListWithCRUDPage> createState() => _TravelListWithCRUDPageState();
}

class _TravelListWithCRUDPageState extends State<TravelListWithCRUDPage> {
  late Future<List<Travel>> _travelList;

  @override
  void initState() {
    super.initState();
    _loadTravels();
  }

  Future<void> _loadTravels() async {
    setState(() {
      _travelList = travels();
    });
  }

  // A method that retrieves all the travels from the travels table.
  Future<List<Travel>> travels() async {
    // Get a reference to the database.
    final db = await openDatabase('travel_database.db');

    // Query the table for all the travels.
    final List<Map<String, dynamic>> maps = await db.query('travels');

    // Convert the List<Map<String, dynamic>> into a List<Travel>.
    return List.generate(maps.length, (i) {
      return Travel(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        picture: maps[i]['picture'] as Uint8List?,
      );
    });
  }

  // Define a function that deletes a travel from the database
  Future<void> deleteTravel(int? id) async {
    // Get a reference to the database.
    final db = await openDatabase('travel_database.db');

    // Delete the travel from the correct table.
    await db.delete(
      'travels',
      where: 'id = ?',
      whereArgs: [id],
    );

    // Reload the travel list after deleting an item
    _loadTravels();
  }

  // Define a function that navigates to the edit page
  Future<void> editTravel(Travel travel) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTravelPage(travel: travel)),
    );
    if (result == true) {
      _loadTravels();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel List"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateTravelPage()),
              );
              if (result == true) {
                _loadTravels();
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Travel>>(
        future: _travelList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No travels available'));
          } else {
            final travelList = snapshot.data!;
            return ListView.builder(
              itemCount: travelList.length,
              itemBuilder: (context, index) {
                final travel = travelList[index];
                return Dismissible(
                  key: Key(travel.id.toString()),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      final result = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Edit or Delete'),
                            content: Text('Choose an action for "${travel.name}"'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Edit'),
                              ),
                            ],
                          );
                        },
                      );
                      if (result == true) {
                        await deleteTravel(travel.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${travel.name} deleted')),
                        );
                      } else {
                        await editTravel(travel);
                      }
                      return result;
                    }
                    return false;
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 8),
                        Icon(Icons.delete, color: Colors.white),
                      ],
                    ),
                  ),
                  child: ListTile(
                    leading: travel.picture != null
                        ? Image.memory(travel.picture!)
                        : Icon(Icons.image),
                    title: Text(travel.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowTravelPage(travel: travel),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
