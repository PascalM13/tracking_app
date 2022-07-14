import 'dart:convert';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

/// Serviceclass to create necessary request of Databasetable ActivityType
///
/// @author: PascalM13
class ActivityTypeService {
  const ActivityTypeService();

  ///Get-Request which returns a activity-type by id
  Future<ActivityTypeModel> getActivityType(int id) async {
    final String url = ApiConstants.activityType + id.toString();
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      return ActivityTypeModel.fromJson(responseJson);
    } else {
      throw Exception('Failed to load ActivityType with id: $id');
    }
  }

  ///Get-Request which returns all acitivity-types
  Future<List<ActivityTypeModel>> getActivityTypes() async {
    final String url = ApiConstants.activityType;
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      //Creating a list to store input data
      List<ActivityTypeModel> activityTypes = [];
      for (var activityType in responseJson) {
        activityTypes.add(ActivityTypeModel.fromJson(activityType));
      }
      return activityTypes;
    } else {
      throw Exception('Failed to load ActivityTypes');
    }
  }
}
