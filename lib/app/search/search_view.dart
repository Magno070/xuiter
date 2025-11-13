import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey.shade600),
          const SizedBox(height: 16),
          Text(
            'Search',
            style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
