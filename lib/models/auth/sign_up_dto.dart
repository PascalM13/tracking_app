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
  int? universityId;

  SignUpDto(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      this.gender,
      this.address,
      this.birthday,
      this.height,
      this.weight,
      this.universityId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['address'] = address;
    data['birthday'] = birthday;
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}
