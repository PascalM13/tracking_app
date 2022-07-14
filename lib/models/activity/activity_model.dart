/// Class which represents the ActivityModel
///
/// @author: PascalM13
// ignore_for_file: unnecessary_brace_in_string_interps

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

  /// Factory Method for parsing a Json Activity-Object to an object of type ActivityModel
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

  /// Function to get a String from start_date day.month.year
  String getDateString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(startDate);
    String date = "${dateTime.day}.${dateTime.month}.${dateTime.year}";
    return date;
  }

  /// Function to get the StartTime String from a Timestamp
  String getStartTimeString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(startDate);
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();

    if (hour.length == 1) {
      hour = "0$hour";
    }

    if (minute.length == 1) {
      minute = "0$minute";
    }

    String date = "${hour}:${minute}";
    return date;
  }

  /// Function to get the EndTime String from a Timestamp
  String getEndTimeString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(endDate);
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();

    if (hour.length == 1) {
      hour = "0$hour";
    }

    if (minute.length == 1) {
      minute = "0$minute";
    }

    String date = "${hour}:${minute}";
    return date;
  }

  /// Function to get the Duration of the Activity by subtracting the end and start date
  String getDuration() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(endDate - startDate);
    String duration = "${dateTime.hour}:${dateTime.minute}";
    return duration;
  }
}
