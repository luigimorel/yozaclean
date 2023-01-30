import 'dart:convert';

import 'package:apps/models/user.dart';
import 'package:apps/themes/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

Future<UserInput> createUser(
    String firstName, String lastName, String phoneNumber, String email) async {
  const String apiUrl = 'http://10.0.2.2:8080/api/v1/register';

  final response = await http.post(Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'lastName': lastName,
        'phone': phoneNumber,
        'email': email
      }));
  if (response.statusCode == 201) {
    return UserInput.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

class UserInput {
  String firstName;
  String lastName;
  String phone;
  String email;

  UserInput(
      {required this.email,
      required this.firstName,
      required this.phone,
      required this.lastName});

  factory UserInput.fromJson(Map<String, dynamic> json) {
    return UserInput(
        phone: json['phone'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email']);
  }
}

// ignore: unused_element
UserModel? _user;

final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _emailController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

late Future<User> _futureUserInput;

final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 24.0),
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _firstNameController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(Radius
                                                            .circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            filled: true,
                                            hintText: 'First Name',
                                            fillColor: Colors.grey[100],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            prefixIcon:
                                                const Icon(Icons.person)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        controller: _lastNameController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(Radius
                                                            .circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            filled: true,
                                            hintText: 'Last Name',
                                            fillColor: Colors.grey[100],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            prefixIcon:
                                                const Icon(Icons.person)),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 3) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        controller: _phoneController,
                                        keyboardType: TextInputType.phone,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                          filled: true,
                                          hintText: '700 000 000',
                                          fillColor: Colors.grey[100],
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          prefixIcon: CountryCodePicker(
                                            initialSelection: '+256',
                                            favorite: const ['+256', 'UG'],
                                            textStyle: const TextStyle(
                                                color: Colors.black54),
                                            showFlag: true,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                            filled: true,
                                            hintText: 'Email',
                                            fillColor: Colors.grey[100],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            prefixIconColor: Colors.grey[300],
                                            prefixIcon: const Icon(
                                                Icons.alternate_email),
                                            focusColor: CustomTheme
                                                .defaultTheme.primaryColor,
                                            iconColor: Colors.grey),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter email address';
                                          }
                                          final regex =
                                              RegExp('[^@]+@[^.]+..+');
                                          if (!regex.hasMatch(value)) {
                                            return 'Enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              var firstname = _firstNameController.text;
                              var lastname = _lastNameController.text;
                              var phoneNo = '+256${_phoneController.text}';
                              var email = _emailController.text;

                              setState(() {
                                createUser(firstname, lastname, phoneNo, email);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    CustomTheme.defaultTheme.primaryColor,
                                minimumSize: const Size.fromHeight(50)),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text(
                            'Already have an account? Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
      ),
    ));
  }
}
