import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications, size: 64, color: Colors.grey.shade600),
          const SizedBox(height: 16),
          Text(
            'Notifications',
            style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
