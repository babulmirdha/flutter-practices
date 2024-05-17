import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'create_person_screen.dart';
import 'person.dart';

class PersonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Person>('persons').listenable(),
        builder: (context, Box<Person> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No persons added yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final person = box.getAt(index);
              return ListTile(
                title: Text(person!.name),
                subtitle: Text('Age: ${person.age}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePersonScreen(person: person),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        person.delete();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePersonScreen(),
            ),
          );
        },
      ),
    );
  }
}
