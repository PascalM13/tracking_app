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
}
