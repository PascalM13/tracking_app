import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:http/http.dart' as http;

class ApiServiceHelper {
  const ApiServiceHelper();

  ///Helper Function to create a Get Request
  Future<http.Response> createGetRequest(
      String path, bool tokenRequired) async {
    //Variables
    String? token;
    final http.Response res;
    //Create url for Get Request
    final url = Uri.parse(ApiConstants.baseUrl + path);

    //Check if token is required
    if (tokenRequired == true) {
      const storage = FlutterSecureStorage();
      token = await storage.read(key: 'access_token');
    }

    //Create a get Request by Token Status
    if (tokenRequired == true && token != null) {
      res = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    } else {
      res = await http.get(url);
    }
    return res;
  }

  ///Helper Function to create a Post Request
  Future<http.Response> createPostRequest(
      String path, dynamic dto, bool tokenRequired) async {
    //Variables
    String? token;
    final http.Response res;
    //Create url for Get Request
    final url = Uri.parse(ApiConstants.baseUrl + path);

    //Check if token is required
    if (tokenRequired == true) {
      const storage = FlutterSecureStorage();
      token = await storage.read(key: 'access_token');
    }

    //Create a get Request by Token Status
    if (tokenRequired == true && token != null) {
      res = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          body: dto.toJson());
    } else {
      var json = dto.toJson();
      var jsonEnc = jsonEncode(json);
      res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: jsonEnc);
    }
    return res;
  }
}
