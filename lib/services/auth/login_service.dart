import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/models/dto/login_dto.dart';
import 'package:http/http.dart' as http;

class LoginService {
  const LoginService();

  Future<bool> login(LoginDto dto) async {
    var url = Uri.parse('http://10.0.2.2:3333/auth/signin');
    var res = await http
        .post(url, body: {'email': dto.email, 'password': dto.password});

    // Backend return 201 if Login was successfully
    if (res.statusCode == 201) {
      final jsonToken = jsonDecode(res.body);
      if (jsonToken['access_token' != null]) {
        const storage = FlutterSecureStorage();
        storage.write(key: "access_token", value: jsonToken['access_token']);
        return true;
      } else {
        return false;
      }
    } else {
      log("Incorrect credentials at Endpoit: 'http://10.0.2.2:3333/auth/signin'");
      return false;
    }
  }
}
