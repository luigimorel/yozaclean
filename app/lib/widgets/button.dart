import 'package:flutter/material.dart';

import '../themes/colors.dart';

class ButtonWidget extends StatelessWidget {
  final Widget route;
  final String buttonText;

  const ButtonWidget(
      {super.key, required this.buttonText, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => route));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomTheme.defaultTheme.primaryColor,
                  minimumSize: const Size.fromHeight(50)),
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
