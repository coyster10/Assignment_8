import 'package:dio/dio.dart';

import './Models/courses.dart';
import './Models/students.dart';

//const String localhost = 'localhost:1200';
const String localhost = 'http://10.0.2.2:1200';

class courseAPI{

  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getAllCourses() async {

    final response = await _dio.get('/getAllCourses');

    return response.data['courses'];

  }

  Future<List> deleteCourseByID(String id) async {

    final response = await _dio.post('/deleteCourseByID', data: {'id': id});

    return response.data;
  }
}

class studentAPI{

  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getAllStudents() async {

    final response = await _dio.get('/getAllStudents');

    return response.data['students'];

  }

  Future<List> editStudent () async {

    final response = await _dio.post('/editStudentById');

    return response.data;
  }
}