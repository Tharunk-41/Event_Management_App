import '../models/student.dart';

abstract class Action {}

class AddStudent extends Action {
  Student newStudent;
  AddStudent({required this.newStudent});
}

class RemoveStudent extends Action {
  String name;
  RemoveStudent({required this.name});
}
