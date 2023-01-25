import 'package:apps/screens/navigation.dart';
import 'package:apps/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

TextEditingController _otpController = TextEditingController();
String currentText = '';

class _OTPState extends State<OTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formChanged = false;
  bool _isDefaultFlag = false;

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
                  Container(
                    height: 277,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/upper.png'),
                          fit: BoxFit.cover),
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
                                'Enter OTP',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 45),
                              child: Text(
                                'A 6 digit code has been sent to your phone number ',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  activeColor: Colors.grey[200],
                                  selectedColor: Colors.grey[500],
                                  inactiveColor: Colors.grey[500],
                                  activeFillColor: Colors.white,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                controller: _otpController,
                                onChanged: (value) {
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                                appContext: context,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't receive the code? ",
                          ),
                          InkWell(
                            onTap: () async {
                              String url = "https://www.fluttercampus.com";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: const Text(
                              'Resend',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ],
              ),
              const ButtonWidget(buttonText: 'Submit', route: MainNavigation())
            ],
          ),
        ),
      ),
    );
  }
}
