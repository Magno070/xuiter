import 'package:flutter/material.dart';

class BottomNavigationArgs {
  final Widget? child;
  final IconData? icon;
  final VoidCallback? onTap;

  BottomNavigationArgs({
    required this.child,
    required this.icon,
    required this.onTap,
  });
}
