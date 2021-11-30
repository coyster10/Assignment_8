
import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'editStudent.dart';

class EditCourse extends StatefulWidget {
  final String id, courseID, courseName, courseCredits;

  final courseAPI courseApi = courseAPI();
  final studentAPI studentApi = studentAPI();

  EditCourse(this.id, this.courseID, this.courseName, this.courseCredits);

  @override
  _EditCourseState createState() => _EditCourseState(id, courseID, courseName, courseCredits);
}

class _EditCourseState extends State<EditCourse> {
  final String id, courseID, courseName, courseCredits;

  List students = [];
  bool _dbLoaded = false;

  _EditCourseState(this.id, this.courseID, this.courseName, this.courseCredits);

  void initState() {
    super.initState();

    widget.studentApi.getAllStudents().then((data) {
      setState(() {
        students = data;
        _dbLoaded = true;
      });
    });
  }

  void _removeCourse(id) {
    setState(() {
      widget.courseApi.deleteCourseByID(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.courseName + " | " + widget.courseID + " | " + widget.courseCredits),
        ),
        body: Center(
          child: _dbLoaded ? 
          Column( children: [Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: [
                ...students
                .map<Widget>((students) => Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 30),
                  child: TextButton(
                      onPressed: () => {
                        Navigator.pop(context),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditStudent(
                              students['_id'],
                              students['fName'],
                              students['lName'],
                              students['studentID'],
                            )
                          )
                        ),
                      },child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Text(students['fname'] + " " + students['lname']),)
                        )
                      )
                      )
                )
                .toList()
              ]),
              ), 
                  ],
                  
                ) : Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Database Loading", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CircularProgressIndicator()]
            ,),
                  )
              ,
              floatingActionButton: FloatingActionButton(
            child: Icon(Icons.home),
            onPressed: () => {
                  Navigator.pop(context),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  ),
                })
          );
  }
}
