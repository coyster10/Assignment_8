
import 'package:flutter/material.dart';
import 'api.dart';
import 'editCourse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bailey School',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final courseAPI api = courseAPI();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List courses = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getAllCourses().then((data) {
      setState(() {
        courses = data;
        _dbLoaded = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bailey School"),
      ),
      body: Center(
        child: _dbLoaded ? 
        Column( children: [Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: [
              ...courses
              .map<Widget>((courses) => Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 30),
                child: TextButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCourse(
                          courses['_id'],
                          courses['courseID'],
                          courses['courseName'], 
                          courses['courseCredits'],
                        )
                      )
                ),
                  },
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Text(courses['courseName']),
                    ),
                    title: Text(
                      (courses['courseInstructor'] + "   " + courses['courseCredits']),
                      style: TextStyle(fontSize: 20),
                    ),
                      ),
                    ),
                ),
              )
              .toList(),
            ]),
        ),
        ],
        )
         : Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Database Loading", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CircularProgressIndicator()]
            ,)
      ),
    );
  }
}
