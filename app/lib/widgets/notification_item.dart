import 'package:flutter/material.dart';

class NotifcationItem extends StatelessWidget {
  const NotifcationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [Icon(Icons.notification_add)],
    );
  }
}
