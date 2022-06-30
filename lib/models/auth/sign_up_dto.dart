class SignUpDto {
  //Required
  final String email;
  final String password;
  final String firstName;
  final String lastName;

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
    this.gender,
    this.address,
    this.birthday,
    this.height,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender!.toUpperCase();
    data['address'] = address;
    data['birthday'] = birthday;
    data['height'] = height;
    data['weight'] = weight;
    data['role'] = "USER"; //Needs to be send

    return data;
  }
}
