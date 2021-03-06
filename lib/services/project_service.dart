import 'dart:convert';

import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/project/project_model.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class ProjectService {
  const ProjectService();

  ///Get-Request which returns the current project of the User
  Future<ProjectModel> getProject() async {
    final String url = ApiConstants.projectAll;
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);
      return ProjectModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load Project ');
    }
  }
}
