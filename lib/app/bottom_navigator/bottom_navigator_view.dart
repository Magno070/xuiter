import 'package:flutter/material.dart';
import 'package:xuiter/app/bottom_navigator/bottom_navigation_args.dart';
import 'package:xuiter/app/bottom_navigator/bottom_navigator_widget.dart';

class BottomNavigatorView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorView({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationArgs> args = [
      BottomNavigationArgs(
        child: const Text("Home"),
        icon: Icons.home,
        onTap: () => onTap(0),
      ),
      BottomNavigationArgs(
        child: const Text("Search"),
        icon: Icons.search,
        onTap: () => onTap(1),
      ),
      BottomNavigationArgs(
        child: const Text("Notifications"),
        icon: Icons.notifications,
        onTap: () => onTap(2),
      ),
      BottomNavigationArgs(
        child: const Text("Messages"),
        icon: Icons.message,
        onTap: () => onTap(3),
      ),
    ];
    return Row(
      children: [
        for (var i = 0; i < args.length; i++)
          BottomNavigatorWidget(
            iconData: args[i].icon,
            onTap: args[i].onTap,
            isSelected: currentIndex == i,
          ),
      ],
    );
  }
}
