class UniversityModel {
  final int id;
  final String name;
  final String address;

  const UniversityModel(
      {required this.id, required this.name, required this.address});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
        id: json['id'], name: json['name'], address: json['address']);
  }
}
