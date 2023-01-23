import 'package:apps/screens/home.dart';
import 'package:apps/themes/colors.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
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
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
