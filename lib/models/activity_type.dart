class ActivityType {
  final String name;

  ActivityType({required this.name});

  factory ActivityType.fromJson(Map<String, dynamic> json) {
    return ActivityType(name: json['name']);
  }
}
