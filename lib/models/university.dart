class University {
  final int id;
  final String name;
  final String address;

  const University(
      {required this.id, required this.name, required this.address});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        id: json['id'], name: json['name'], address: json['address']);
  }
}
