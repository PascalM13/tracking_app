import 'dart:convert';

import 'package:tracking_app/api_constans.dart';
import 'package:tracking_app/models/news/news_model.dart';
import 'package:tracking_app/models/project/project_model.dart';
import 'package:tracking_app/services/project_service.dart';
import 'package:tracking_app/services/service_helper/api_service_helper.dart';

class UniversityService {
  const UniversityService();

  ///Get-Request which returns all News
  Future<List<NewsModel>> getNews() async {
    final ProjectModel project = await ProjectService().getProject();
    final String url = ApiConstants.newsAll + project.id.toString();
    final res = await const ApiServiceHelper().createGetRequest(url, true);
    if (res.statusCode == 200) {
      final responseJson = jsonDecode(res.body);

      List<NewsModel> newsList = [];
      for (var news in responseJson) {
        newsList.add(NewsModel.fromJson(news));
      }
      return newsList;
    } else {
      throw Exception('Failed to load News');
    }
  }
}
