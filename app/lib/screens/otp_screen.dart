import 'package:apps/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formChanged = false;
  bool _isDefaultFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 277,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/upper.png"), fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(38, 30, 38, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 14.0),
                          child: Text(
                            "Enter OTP",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: Row(
                            children: const [
                              Text(
                                "A 6 digit code has been sent to ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                "+256 704 123 321",
                                style: TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Form(
                            key: _formKey,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    keyboardType: TextInputType.number,
                                    autofocus: true,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 0, 38, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomTheme.defaultTheme.primaryColor,
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 21),
                  child: Text(
                    "Don’t have an account yet? Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
