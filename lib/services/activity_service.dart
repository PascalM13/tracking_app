import 'dart:convert';

import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/models/activity/activity_dto.dart';
import 'package:tracking_app/models/activity/activity_model.dart';
import 'package:tracking_app/models/user/user_model.dart';
import 'package:tracking_app/services/acitivity_type_service.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class ActivityService {
  const ActivityService();

  ///Get-Request which returns a activity by id
  Future<ActivityModel> getActivity(int id) async {
    final String url = ApiConstants.actity + id.toString();
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      ActivityModel activtiyModel = ActivityModel.fromJson(responseJson);
      ActivityTypeModel activityTypeModel = await const ActivityTypeService()
          .getActivityType(activtiyModel.activityTypeId);
      activtiyModel.activityName = activityTypeModel.name;
      return activtiyModel;
    } else {
      throw Exception('Failed to load Activity with id: $id');
    }
  }

  ///Get-Request which returns all acitivity-types
  Future<List<ActivityModel>> getActivities() async {
    //Create URL
    UserModel currUser = await UserModel().getCurrentUser();
    String userId = currUser.id.toString();
    String projectId = "2";
    final String url = "${ApiConstants.actity}project/$projectId/user/$userId";
    final res = await const ApiServiceHelper().createGetRequest(url, true);

    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      //Creating a list to store input data
      List<ActivityModel> activities = [];
      for (var activity in responseJson) {
        ActivityModel activityModel = ActivityModel.fromJson(activity);
        ActivityTypeModel activityTypeModel = await const ActivityTypeService()
            .getActivityType(activityModel.activityTypeId);
        activityModel.activityName = activityTypeModel.name;
        activities.add(activityModel);
      }
      return activities;
    } else {
      throw Exception('Failed to load Activity');
    }
  }

  Future<ActivityModel> createActivity(ActivityDto dto) async {
    final String url = ApiConstants.actity;
    final res =
        await const ApiServiceHelper().createPostRequest(url, dto, true);

    if (res.statusCode == 201) {
      final responseJson = jsonDecode(res.body);
      ActivityModel activityModel = ActivityModel.fromJson(responseJson);
      ActivityTypeModel activityTypeModel = await const ActivityTypeService()
          .getActivityType(activityModel.activityTypeId);
      activityModel.activityName = activityTypeModel.name;

      return activityModel;
    } else {
      throw Exception("Failed to create Activity");
    }
  }

  Future<ActivityModel> updateActivity(
      Map<String, dynamic> changedAttributes, int id) async {
    final String url = '${ApiConstants.actity}$id';
    final res = await const ApiServiceHelper()
        .createPatchRequest(url, changedAttributes, true);

    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      ActivityModel activityModel = ActivityModel.fromJson(responseJson);
      ActivityTypeModel activityTypeModel = await const ActivityTypeService()
          .getActivityType(activityModel.activityTypeId);
      activityModel.activityName = activityTypeModel.name;

      return activityModel;
    } else {
      throw Exception("Failed to update Activity");
    }
  }
}
