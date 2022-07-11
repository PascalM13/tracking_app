class ActivityTypeModel {
  final int id;
  final String name;
  final double caloriesConsumption;

  ActivityTypeModel(
      {required this.id,
      required this.name,
      required this.caloriesConsumption});

  factory ActivityTypeModel.fromJson(Map<String, dynamic> json) {
    return ActivityTypeModel(
        id: json['id'],
        name: json['name'],
        caloriesConsumption: json['calories_consumption']);
  }

  String calcCalsFromStopwatch(String stopwatchTime, double userWeight) {
    var time = stopwatchTime.split(":");
    double hours = double.parse(time[0]);
    double minutes = double.parse(time[1]);
    double seconds = double.parse(time[2]);

    double caloriesPerSecond = caloriesConsumption / 60;

    double calories = hours * 60.0 * caloriesConsumption +
        minutes * caloriesConsumption +
        seconds * caloriesPerSecond;

    double userWeight = 70.00;
    return (calories * userWeight).toStringAsFixed(2);
  }
}
