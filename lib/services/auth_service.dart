import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/auth/change_password_dto.dart';
import 'package:tracking_app/models/auth/reset_password_dto.dart';
import 'package:tracking_app/models/auth/sign_in_dto.dart';
import 'package:tracking_app/models/auth/sign_up_dto.dart';
import 'package:tracking_app/models/user/user_model.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class AuthService {
  const AuthService();

  ///Post-Request for Login
  Future<int> signIn(SignInDto dto) async {
    final String url = ApiConstants.signIn;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, false);

    if (res.statusCode == 201) {
      final json = jsonDecode(res.body);
      const storage = FlutterSecureStorage();
      storage.write(key: "access_token", value: json['accessToken']);
      UserModel().setCurrentUser(json);

      return res.statusCode;
    } else if (res.statusCode == 401 || res.statusCode == 400) {
      // Wrong Password
      return res.statusCode;
    } else {
      throw Exception('Failed to sign in');
    }
  }

  ///Post-Request for Sign Up
  Future<int> signUp(SignUpDto dto) async {
    final String url = ApiConstants.signUp;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, false);

    if (res.statusCode == 201 ||
        res.statusCode == 409 ||
        res.statusCode == 400) {
      return res.statusCode;
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<int> confirmEmail(String email, String validationCode) async {
    //Base64 encoding process
    final bytesEmail = utf8.encode(email);
    final base64Email = base64.encode(bytesEmail);

    final bytesValidationCode = utf8.encode(validationCode);
    final base64ValidationCode = base64.encode(bytesValidationCode);

    //Start Request
    final String baseUrl =
        "${ApiConstants.baseUrl}${ApiConstants.confirmEmail}$base64Email/$base64ValidationCode";
    final url = Uri.parse(baseUrl);
    final res = await http.post(url);

    if (res.statusCode == 201) {
      final json = jsonDecode(res.body);
      // Save recieved access token in secure storage
      const storage = FlutterSecureStorage();
      storage.write(key: "access_token", value: json['accessToken']);

      // Save user data in SharedPreferences
      UserModel().setCurrentUser(json);

      return res.statusCode;
    } else if (res.statusCode == 401 || res.statusCode == 400) {
      return res.statusCode;
    } else {
      throw Exception("Cant validate Email");
    }
  }

  ///Post-Request for reseting the password
  Future<int> resetPassword(ResetPasswordDto dto) async {
    final String url = ApiConstants.resetPassword;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, false);

    if (res.statusCode == 201 || res.statusCode == 400) {
      return res.statusCode;
    } else {
      throw Exception('Failed to reset password');
    }
  }

  ///Post-Request for changing the password after reset
  Future<int> changePassword(ChangePasswordDto dto) async {
    final String url = ApiConstants.changePassword;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, false);

    if (res.statusCode == 201 || res.statusCode == 400) {
      return res.statusCode;
    } else {
      throw Exception('Failed to change password');
    }
  }
}
