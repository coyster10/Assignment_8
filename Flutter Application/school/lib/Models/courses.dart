class Course {
  final String id;
  final String courseID;
  final String courseName;

  Course._(this.id, this.courseID, this.courseName);

  factory Course.fromJson(Map json){
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final courseID = json['courseID'];
    final courseName = json['courseName'];

    return Course._(id, courseID, courseName);
  }

}