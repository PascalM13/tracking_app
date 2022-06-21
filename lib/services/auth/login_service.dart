import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/dto/login_dto.dart';
import 'package:http/http.dart' as http;

class LoginService {
  const LoginService();

// Service for Login and Storing the JWT-Token
  Future<http.Response?> login(LoginDto dto) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.signIn);
    try {
      var res = await http
          .post(url, body: {'email': dto.email, 'password': dto.password});

      // Backend return 201 if Login was successfully
      if (res.statusCode == 201) {
        final jsonToken = jsonDecode(res.body);
        const storage = FlutterSecureStorage();
        storage.write(key: "access_token", value: jsonToken['access_token']);
      }
      return res;
    } on SocketException {
      log("No internet connection");
    } catch (err) {
      log(err.toString());
    }
  }
}
