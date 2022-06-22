class ActivityType {
  final int id;
  final String name;

  ActivityType({required this.id, required this.name});

  factory ActivityType.fromJson(Map<String, dynamic> json) {
    return ActivityType(id: json['id'], name: json['name']);
  }
}
