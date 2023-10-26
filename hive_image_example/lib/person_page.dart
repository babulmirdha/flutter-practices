import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_image_example/person.dart';


class PersonPage extends StatelessWidget {
  final box = Hive.box('persons');

  PersonPage({super.key}); // Open a box named 'persons'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add a person to the box
                var person = Person()
                  ..name = 'John Doe'
                  ..age = 30;
                box.add(person);
              },
              child: Text('Add Person'),
            ),
            ElevatedButton(
              onPressed: () {
                // Retrieve all persons from the box
                for (var i = 0; i < box.length; i++) {
                  var person = box.getAt(i) as Person;
                  print('Person ${i + 1}: ${person.name}, ${person.age}');
                }
              },
              child: Text('Retrieve Persons'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update the first person in the box
                if (box.isNotEmpty) {
                  var person = box.getAt(0) as Person;
                  person.age = 31;
                  box.putAt(0, person);
                }
              },
              child: Text('Update First Person'),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the first person from the box
                if (box.isNotEmpty) {
                  box.deleteAt(0);
                }
              },
              child: Text('Delete First Person'),
            ),
          ],
        ),
      ),
    );
  }

}