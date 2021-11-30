class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String studentID;

  Student._(this.id, this.firstName, this.lastName, this.studentID);

  factory Student.fromJson(Map json){
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final firstName = json['fname'];
    final lastName = json['lname'];
    final studentID = json['studentID'];

    return Student._(id, firstName, lastName, studentID);
  }

}