class ActivityModel {
  final int id;
  final int startDate;
  final int endDate;
  final int hearthrate;
  final int steps;
  final int distance;
  final int bloodSugarOxygen;
  //References
  final int activityTypeId;
  String? activityName;

  ActivityModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.hearthrate,
      required this.steps,
      required this.distance,
      required this.bloodSugarOxygen,
      required this.activityTypeId,
      this.activityName});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      startDate: int.parse(json['start_date']),
      endDate: int.parse(json['end_date']),
      hearthrate: json['hearthrate'],
      steps: json['steps'],
      distance: json['distance'],
      bloodSugarOxygen: json['bloodSugarOxygen'],
      activityTypeId: json['activityTypeId'],
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
