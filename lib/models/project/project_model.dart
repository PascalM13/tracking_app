class ProjectModel {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final String name;
  final String description;

  ProjectModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.name,
      required this.description});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    var dtStart =
        DateTime.fromMillisecondsSinceEpoch(int.parse(json['start_date']));
    var dtEnd =
        DateTime.fromMillisecondsSinceEpoch(int.parse(json['end_date']));

    return ProjectModel(
        id: json['id'],
        startDate: dtStart,
        endDate: dtEnd,
        name: json['name'],
        description: json['description']);
  }
}
