import 'dart:convert';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/acitvity_type/activity_type.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class ActivityTypeService {
  const ActivityTypeService();

  ///Get-Request which returns a activity-type by id
  Future<ActivityType> getActivityType(int id) async {
    final String url = ApiConstants.activityType + id.toString();
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      return ActivityType.fromJson(responseJson);
    } else {
      throw Exception('Failed to load ActivityType with id: $id');
    }
  }

  ///Get-Request which returns all acitivity-types
  Future<List<ActivityType>> getUniversities() async {
    final String url = ApiConstants.university;
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      //Creating a list to store input data
      List<ActivityType> universities = [];
      for (var activityType in responseJson) {
        universities.add(ActivityType.fromJson(activityType));
      }
      return universities;
    } else {
      throw Exception('Failed to load ActivityTypes');
    }
  }
}
