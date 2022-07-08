class ActivityModel {
  final int id;
  final int startDate;
  final int endDate;
  final int hearthrate;
  final int steps;
  final int distance;
  final int bloodSugarOxygen;
  //References
  final int userId;
  final int activityTypeId;
  final int projectId;
  String? activityName;

  ActivityModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.hearthrate,
      required this.steps,
      required this.distance,
      required this.bloodSugarOxygen,
      required this.userId,
      required this.activityTypeId,
      required this.projectId,
      this.activityName});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      hearthrate: json['hearthrate'],
      steps: json['steps'],
      distance: json['distance'],
      bloodSugarOxygen: json['bloodSugarOxygen'],
      userId: json['userId'],
      activityTypeId: json['activityTypeId'],
      projectId: json['projectId'],
    );
  }

  String getDateString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(startDate);
    String date = "${dateTime.day}. ${dateTime.month} .${dateTime.year}";
    return date;
  }

  String getDuration() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(endDate - startDate);
    String duration = "${dateTime.hour}:${dateTime.minute}";
    return duration;
  }
}
