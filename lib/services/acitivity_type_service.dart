import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_app/models/activity_type.dart';

class ActivityTypeService {
  const ActivityTypeService();

  ///Http-Get-Request which returns a activity-type by id
  Future<ActivityType?> getActivityType(int id) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.activityType + id.toString());
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'access_token');

    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token!}',
      });

      final responseJson = jsonDecode(response.body);

      return ActivityType.fromJson(responseJson);
    } catch (e) {
      //TODO: Redirect to Welcome if we get a 401 unauthorized?
      log(e.toString());
      return null;
    }
  }

  ///Http-Get-Request which returns a List of acitivity-type
}
