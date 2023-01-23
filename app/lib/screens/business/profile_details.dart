import 'package:flutter/material.dart';

class ProfileLink extends StatelessWidget {
  final IconData icon;
  final String linkText;

  const ProfileLink({super.key, required this.icon, required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            linkText,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
    ]);
  }
}
