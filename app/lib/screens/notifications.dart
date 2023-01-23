import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'home.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Column(
            children: const [Text('Hello')],
          ),
        ),
      ),
    );
  }
}
