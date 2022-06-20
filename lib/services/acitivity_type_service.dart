import 'package:tracking_app/api_constans.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_app/models/activity_type.dart';

class ActivityTypeService {
  const ActivityTypeService();

  Future<ActivityType> getActivityType(int id) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.activityType + id.toString());
  }
}
