import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;

  UserModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email']);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email
      };
}
