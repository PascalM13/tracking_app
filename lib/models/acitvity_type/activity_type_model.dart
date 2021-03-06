/// Class which represents the ActivityType
///
/// @author: PascalM13
class ActivityTypeModel {
  final int id;
  final String name;
  final double caloriesConsumption;

  ActivityTypeModel(
      {required this.id,
      required this.name,
      required this.caloriesConsumption});

  /// Factory Method for parsing a Json ActivityType-Object to an object of type ActivityTypeModel
  factory ActivityTypeModel.fromJson(Map<String, dynamic> json) {
    return ActivityTypeModel(
        id: json['id'],
        name: json['name'],
        caloriesConsumption: json['calories_consumption']);
  }

  /// Function to Calculate Calories from Stopwatch -> calories of activity = caloriesConsumption * minutes
  String calcCalsFromStopwatch(String stopwatchTime, double userWeight) {
    var time = stopwatchTime.split(":");
    double hours = double.parse(time[0]);
    double minutes = double.parse(time[1]);
    double seconds = double.parse(time[2]);

    double caloriesPerSecond = caloriesConsumption / 60;

    double calories = hours * 60.0 * caloriesConsumption +
        minutes * caloriesConsumption +
        seconds * caloriesPerSecond;

    return (calories * userWeight).toStringAsFixed(2);
  }
}
