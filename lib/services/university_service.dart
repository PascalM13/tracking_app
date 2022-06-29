import 'dart:convert';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/university/university.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class UniversityService {
  const UniversityService();

  ///Get-Request which returns a University by id
  Future<University> getUniversityById(int id) async {
    final String url = ApiConstants.university + id.toString();
    final res = await const ApiServiceHelper().createGetRequest(url, false);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      return University.fromJson(responseJson);
    } else {
      throw Exception('Failed to load University with id: $id');
    }
  }

  ///Get-Request which returns all Universities
  Future<List<University>> getUniversities() async {
    final String url = ApiConstants.university;
    final res = await const ApiServiceHelper().createGetRequest(url, false);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      //Creating a list to store input data
      List<University> universities = [];
      for (var university in responseJson) {
        universities.add(University.fromJson(university));
      }
      return universities;
    } else {
      throw Exception('Failed to load Universities');
    }
  }
}
