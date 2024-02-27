import 'dart:convert';

import 'package:collegelistapi/models/college_model.dart';
import 'package:http/http.dart' as http;

Future<List<CollegeModel>> collegeDataService() async {
  final response = await http
      .get(Uri.parse('http://universities.hipolabs.com/search?name=middle'));
  print(response.statusCode);
  print('ssssssssssssss');
  if (response.statusCode == 200) {
    List<CollegeModel> collegeModel=collegeModelFromJson(response.body);
    return collegeModel;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
