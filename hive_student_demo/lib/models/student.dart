import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject{
 @HiveField(0)
 late String name;
 @HiveField(1)
 late String dept;
}