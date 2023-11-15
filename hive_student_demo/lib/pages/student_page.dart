import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/student.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {


  late Box<Student> box;

  @override
  void initState() {
    Hive.registerAdapter(StudentAdapter());
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student"),),
      body:
      Column(
        children: [
          TextButton(onPressed: (){


           var student = Student();

           student.name = "Shopon";
           student.dept = "Flutter";

            box.add(student);

          }, child: const Text("Add a student")
          ),

          TextButton(onPressed: (){

            showAllStudents();


          }, child: const Text("Retrieve all students")
          ),
        ],
      ),
    );
  }

  Future<void> _init() async {
     box = await Hive.openBox("students");
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }

  void showAllStudents() {

    for(int i = 0; i<box.length; i++){
      var student = box.getAt(i);
      print("Name: ${student?.name}, Dept: ${student?.dept}");
    }

  }

}
