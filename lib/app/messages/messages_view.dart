import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message, size: 64, color: Colors.grey.shade600),
          const SizedBox(height: 16),
          Text(
            'Messages',
            style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
