import 'package:apps/screens/business/add-business.dart';
import 'package:apps/themes/colors.dart';
import 'package:apps/widgets/profile_icon.dart';
import 'package:apps/widgets/profile_item.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          color: CustomTheme.defaultTheme.primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
                child: Text(
              'Edit',
              style: TextStyle(color: Colors.black54),
            )),
          )
        ],
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/profile.png',
                        height: 70,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Luigi Morel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomTheme.defaultTheme.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProfileIcon(
                        icon: Icons.list_alt_rounded, descText: 'Orders'),
                    ProfileIcon(icon: Icons.business, descText: 'Business'),
                    ProfileIcon(icon: Icons.settings, descText: 'Settings'),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: const [
                  ProfileItem(
                      itemText: 'Add a business',
                      icon: Icons.business_center,
                      forwardicon: Icons.arrow_forward_ios_rounded,
                      route: AddABusiness()),
                  ProfileItem(
                      itemText: 'Settings',
                      icon: Icons.settings_sharp,
                      forwardicon: Icons.arrow_forward_ios_rounded,
                      route: AddABusiness()),
                  ProfileItem(
                      itemText: 'Contact Support',
                      icon: Icons.settings_sharp,
                      forwardicon: Icons.arrow_forward_ios_rounded,
                      route: AddABusiness()),
                  ProfileItem(
                      itemText: 'Location',
                      icon: Icons.near_me,
                      forwardicon: Icons.arrow_forward_ios_rounded,
                      route: AddABusiness()),
                  ProfileItem(
                    itemText: 'Logout',
                    icon: Icons.logout_rounded,
                    route: AddABusiness(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
