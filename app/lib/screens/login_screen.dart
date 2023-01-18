import 'package:apps/screens/otp_screen.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 277,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/upper.png"), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(38, 40, 38, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          prefixText: "+256",
                          prefixStyle: TextStyle(fontSize: 14),
                          prefixIcon: ImageIcon(
                            AssetImage(
                              'icons/flags/png/ug.png',
                              package: "country_icons",
                            ),
                            size: 14,
                          ),
                          hintText: '702 123 567',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          }

                          final regex = RegExp('[0-9]');
                          if (!regex.hasMatch(value)) {
                            return 'Enter a phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTP()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  CustomTheme.defaultTheme.primaryColor,
                              minimumSize: const Size.fromHeight(50)),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 21),
                    child: Text(
                      "Don’t have an account yet? Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
