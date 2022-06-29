import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/user/update_user_mail_dto.dart';
import 'package:tracking_app/models/user/update_user_password_dto.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class UserService {
  ///Http-Post-Request
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

  ///Http-Post-Request
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
}
