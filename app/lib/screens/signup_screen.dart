import 'package:apps/screens/login_screen.dart';
import 'package:apps/themes/colors.dart';
import 'package:apps/widgets/button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController _phoneController = TextEditingController();
// String phoneNumber = "";

// void _onCountryChange(CountryCode countryCode) {
//   phoneNumber = countryCode.toString();
//   print("New Country selected: " + countryCode.toString());
// }

// void check() {
//   print('Full Text: ' + phoneNumber + _phoneController.text);
// }

// final _phoneController = TextEditingController();
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _emailController = TextEditingController();
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
                                        keyboardType: TextInputType.phone,
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
                                        keyboardType: TextInputType.phone,
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
                                        keyboardType: TextInputType.number,
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
                children: const [
                  ButtonWidget(buttonText: 'Sign Up', route: Login()),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Already have an account? Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
