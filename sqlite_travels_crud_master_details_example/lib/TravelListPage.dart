import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'CreateTravelPage.dart';
import 'Travel.dart';
import 'dart:typed_data';
class TravelListPage extends StatefulWidget {
  const TravelListPage({super.key});

  @override
  State<TravelListPage> createState() => _TravelListPageState();
}

class _TravelListPageState extends State<TravelListPage> {

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel List"),
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
                return ListTile(
                  leading: travel.picture != null
                      ? Image.memory(travel.picture!)
                      : Icon(Icons.image),
                  title: Text(travel.name),
                  onTap: () {
                    // Handle travel item tap
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton( child: Icon(Icons.add),
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
    );
  }
}