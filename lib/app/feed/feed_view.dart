import 'package:flutter/material.dart';
import 'package:xuiter/app/vertical_navigator/vertical_navigator_view.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const VerticalNavigatorView(),
      appBar: AppBar(title: const Text('Feed View')),
      body: const Center(child: Text('Welcome to the Feed View!')),
    );
  }
}
