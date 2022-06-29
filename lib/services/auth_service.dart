import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/auth/sign_in_dto.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class AuthService {
  const AuthService();

  ///Post-Request for Login
  Future<int> signIn(SignInDto dto) async {
    final String url = ApiConstants.signIn;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, false);

    if (res.statusCode == 201) {
      final jsonToken = jsonDecode(res.body);
      const storage = FlutterSecureStorage();
      storage.write(key: "access_token", value: jsonToken['access_token']);

      return res.statusCode;
    } else if (res.statusCode == 400) {
      return res.statusCode;
    } else {
      throw Exception('Failed to sign in');
    }
  }
}
