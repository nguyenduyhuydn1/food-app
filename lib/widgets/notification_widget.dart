import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final Color color;
  const NotificationWidget({
    super.key,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Icon(
        Icons.notifications_none,
        color: color,
      ),
    );
  }
}
