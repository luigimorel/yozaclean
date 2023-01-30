import 'package:apps/screens/home.dart';
import 'package:apps/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class AddABusiness extends StatefulWidget {
  const AddABusiness({super.key});

  @override
  State<AddABusiness> createState() => _AddABusinessState();
}

class _AddABusinessState extends State<AddABusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a business',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          color: CustomTheme.defaultTheme.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                            backgroundBlendMode: BlendMode.lighten,
                            color: Colors.red),
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.business,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Business name'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                            backgroundBlendMode: BlendMode.lighten,
                            color: Colors.white),
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Business phone number'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(),
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Business email'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(),
                        ),
                        child: const TextField(
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.badge,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Motto'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(),
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.near_me,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Address'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(),
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.url,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.link,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: 'Website'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ButtonWidget(
                          buttonText: 'Submit', route: HomeScreen())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
