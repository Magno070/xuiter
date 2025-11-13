import 'package:flutter/material.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Feed View!',
        style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
      ),
    );
  }
}
