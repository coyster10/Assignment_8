

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'editCourse.dart';

class EditStudent extends StatefulWidget {
  final String id, firstName, lastName, studentID;

  final studentAPI api = studentAPI();

  EditStudent(this.id, this.firstName, this.lastName, this.studentID);

  @override
  _EditStudentState createState() => _EditStudentState(id, firstName, lastName, studentID);
}

class _EditStudentState extends State<EditStudent> {
  final String id, firstName, lastName, studentID;

  _EditStudentState(this.id, this.firstName, this.lastName, this.studentID);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

//void _removeStudent(id) {
  //setState(() {
    //widget.api.editStudent(id);
  //});
//}

@override  
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Student List"),
    ),
    body:Center(
      child: Column(
        children: <Widget>[
          Padding( 
          padding: const EdgeInsets.all(10),
          child: Column( 
            children: <Widget>[
              TextFormField(),
              ElevatedButton(
                onPressed: () => {
                  //_removeStudent(widget.id),
                },
                child: Text("Apply")),
            ]
            )
            )
            ]
      )
    )
          );

}
