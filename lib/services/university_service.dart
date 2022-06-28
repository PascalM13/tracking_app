import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/university.dart';
import 'package:http/http.dart' as http;

class UniversityService {
  const UniversityService();

  ///Http-Get-Request which returns a University by id
  Future<University?> getUniversityById(int id) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.university + id.toString());
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'access_token');

    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token!}',
      });

      final responseJson = jsonDecode(response.body);

      return University.fromJson(responseJson);
    } catch (e) {
      //TODO: Redirect to Welcome if we get a 401 unauthorized?
      log(e.toString());
      return null;
    }
  }

  ///Http-Get-Request which returns a all Universities
  Future<List<University>?> getUniversities() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.university);
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'access_token');

    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token!}',
      });

      final responseJson = jsonDecode(response.body);

      //Creating a list to store input data
      List<University> universities = [];
      for (var university in responseJson) {
        universities.add(University.fromJson(university));
      }

      return universities;
    } catch (e) {
      //TODO: Redirect to Welcome if we get a 401 unauthorized?
      log(e.toString());
      return null;
    }
  }
}
