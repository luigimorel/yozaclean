import 'package:apps/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String itemText;
  final IconData? forwardicon;
  final Widget route;

  const ProfileItem(
      {super.key,
      required this.itemText,
      required this.icon,
      required this.route,
      this.forwardicon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[300]),
                    child: Icon(
                      icon,
                      color: CustomTheme.defaultTheme.primaryColor
                          .withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    itemText,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  )
                ],
              ),
              Icon(
                forwardicon,
                color: Colors.black87,
                size: 16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
