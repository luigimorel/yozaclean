import 'package:apps/screens/business/profile_details.dart';
import 'package:apps/screens/business/profile_service_card.dart';
import 'package:apps/screens/home.dart';
import 'package:apps/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Cleaners',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Quality Cleaners at your service')],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ProfileLink(
                            icon: Icons.phone, linkText: '+256 704 123 947'),
                        ProfileLink(
                            icon: Icons.link, linkText: 'https://super.com'),
                        ProfileLink(
                            icon: Icons.facebook,
                            linkText: 'https://facebook.com/supercom'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Services',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: const [
                      ProfileServiceCard(
                        image: 'assets/clean.png',
                        amount: '50,000',
                        jobType: 'Carpet Cleaning',
                        unit: 'carpet',
                      ),
                      ProfileServiceCard(
                        image: 'assets/clean.png',
                        amount: '50,000',
                        jobType: 'After Event Cleaning',
                        unit: 'person',
                      ),
                      ProfileServiceCard(
                        image: 'assets/upper.png',
                        amount: '20,000',
                        jobType: 'Construction',
                        unit: 'person',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ButtonWidget(buttonText: 'Book', route: HomeScreen())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
