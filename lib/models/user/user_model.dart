import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String? gender;
  String? address;
  int? birthday;
  int? height;
  int? weight;
  int? id;
  String? email;
  String? role;
  String? firstName;
  String? lastName;

  UserModel(
      {this.gender,
      this.address,
      this.birthday,
      this.height,
      this.weight,
      this.id,
      this.email,
      this.role,
      this.firstName,
      this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['birthday'] == null) {
      birthday = null;
    } else if (json['birthday'] is String) {
      birthday = int.parse(json['birthday']);
    } else {
      birthday = json['birthday'];
    }

    gender = json['gender'];
    address = json['address'];
    height = json['height'];
    weight = json['weight'];
    id = json['id'];
    email = json['email'];
    role = json['role'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['address'] = address;
    data['birthday'] = birthday;
    data['height'] = height;
    data['weight'] = weight;
    data['id'] = id;
    data['email'] = email;
    data['role'] = role;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }

  void setCurrentUser(dynamic json) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(UserModel.fromJson(json['user']));
    pref.setString('user', user);
  }

  Future<UserModel> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> json = jsonDecode(pref.getString('user')!);
    var user = UserModel.fromJson(json);
    return user;
  }
}
