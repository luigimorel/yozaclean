import 'package:apps/screens/login_screen.dart';
import 'package:flutter/material.dart';

import './../components/link_button.dart';
import '../themes/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final _phoneController = TextEditingController();
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 277,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/upper.png"), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(38, 40, 38, 0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.flag),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(fontSize: 12)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              decoration: const InputDecoration(
                                prefixIcon: ImageIcon(
                                  AssetImage(
                                    'icons/flags/png/ug.png',
                                    package: "country_icons",
                                  ),
                                  size: 16,
                                ),
                                hintText: '+256',
                                hintStyle: TextStyle(fontSize: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter phone number";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.alternate_email_sharp,
                                    size: 14,
                                  ),
                                  hintText: 'Email address',
                                  hintStyle: TextStyle(fontSize: 12)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter email address";
                                }
                                final regex = RegExp('[^@]+@[^\.]+\..+');
                                if (!regex.hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 44),
                      child: Text(
                        "By signing  up, you’re agreeing to our  Terms  & Conditions and Privacy Policy",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                CustomTheme.defaultTheme.primaryColor,
                            minimumSize: const Size.fromHeight(50)),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodySmall,
                          children: <InlineSpan>[
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              style: TextStyle(
                                  color: CustomTheme.defaultTheme.primaryColor),
                              child: const LinkButton(
                                  urlLabel: "Login", url: "/login"),
                            ),
                            const TextSpan(
                              text: ' and ',
                            ),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: LinkButton(
                                  urlLabel: "Privacy Policy",
                                  url: "https://example.com/privacy-policy"),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
