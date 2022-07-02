import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/auth/sign_in_dto.dart';
import 'package:tracking_app/services/acitivity_type_service.dart';

import 'package:tracking_app/models/acitvity_type/activity_type_model.dart';
import 'package:tracking_app/services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('Testing Activity Type Service', () async {
    ApiConstants.baseUrl = "http://localhost:3333/";
    //Test getActivityType

    Future<ActivityTypeModel> activityType =
        const ActivityTypeService().getActivityType(1);

    ActivityTypeModel expectedActivityType =
        ActivityTypeModel(id: 1, name: 'Joggen');

    expect(await activityType, expectedActivityType);
  });
}
