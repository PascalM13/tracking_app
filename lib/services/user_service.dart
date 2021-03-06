import 'dart:convert';

import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/user/update_user_mail_dto.dart';
import 'package:tracking_app/models/user/update_user_password_dto.dart';
import 'package:tracking_app/models/user/user_model.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

/// Serviceclass to create necessary request of Databasetable Activity
///
/// @author: PascalM13
class UserService {
  ///Http-Post-Request to update the Password of the User
  Future<int> updatePassword(UpdateUserPasswordDto dto) async {
    final String url = ApiConstants.userUpdatePassword;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, true);
    if (res.statusCode == 201) {
      return res.statusCode;
    } else {
      throw Exception('Failed to change Password');
    }
  }

  ///Http-Post-Request update the Email of the User
  Future<int> updateEmail(UpdateUserMailDto dto) async {
    final String url = ApiConstants.userUpdateEmail;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, true);
    if (res.statusCode == 201) {
      return res.statusCode;
    } else {
      throw Exception('Failed to change Email');
    }
  }

  ///Http-Patch-Request to update the User
  Future<UserModel> updateUser(Map<String, dynamic> changedAttributes) async {
    final String url = ApiConstants.userUpdate;
    final res = await const ApiServiceHelper()
        .createPatchRequest(url, changedAttributes, true);

    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      UserModel userModel = UserModel.fromJson(responseJson);
      await UserModel().setCurrentUser({"user": responseJson});

      return userModel;
    } else {
      throw Exception("Failed to update User");
    }
  }
}
