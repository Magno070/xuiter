import 'package:flutter/widgets.dart';

class NavigationArgs {
  final String text;
  final Widget? label;
  final IconData? icon;
  final VoidCallback? onTap;
  NavigationArgs({required this.text, this.label, this.icon, this.onTap});
}
