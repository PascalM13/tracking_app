class SignUpDto {
  //Required
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String projectToken;

  //Optional
  String? gender;
  String? address;
  int? birthday;
  int? height;
  int? weight;

  SignUpDto({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.projectToken,
    this.gender,
    this.address,
    this.birthday,
    this.height,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email.toLowerCase();
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['address'] = address;
    data['birthday'] = birthday;
    data['height'] = height;
    data['weight'] = weight;
    data['projectToken'] = projectToken;
    data['role'] = "USER"; //Needs to be send

    return data;
  }
}
