import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final IconData icon;
  final String descText;

  const ProfileIcon({super.key, required this.icon, required this.descText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          descText,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
