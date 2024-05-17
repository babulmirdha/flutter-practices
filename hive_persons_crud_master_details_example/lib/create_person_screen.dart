import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'person.dart';

class CreatePersonScreen extends StatefulWidget {
  final Person? person;

  CreatePersonScreen({this.person});

  @override
  _CreatePersonScreenState createState() => _CreatePersonScreenState();
}

class _CreatePersonScreenState extends State<CreatePersonScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _age;

  @override
  void initState() {
    super.initState();
    if (widget.person != null) {
      _name = widget.person!.name;
      _age = widget.person!.age;
    } else {
      _name = '';
      _age = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person == null ? 'Add Person' : 'Edit Person'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _age.toString(),
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (widget.person == null) {
                      final newPerson = Person()
                        ..name = _name
                        ..age = _age;
                      Hive.box<Person>('persons').add(newPerson);
                    } else {
                      widget.person!.name = _name;
                      widget.person!.age = _age;
                      widget.person!.save();
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.person == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
