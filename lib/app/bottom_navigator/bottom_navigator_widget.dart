import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final Widget? icon;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool isSelected;

  const BottomNavigatorWidget({
    super.key,
    this.icon,
    this.onTap,
    this.iconData,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 50, 50, 50),
        child: IconButton(
          onPressed: onTap ?? () {},
          icon:
              icon ??
              Icon(
                iconData ?? Icons.send,
                color: isSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 190, 190, 190),
              ),
        ),
      ),
    );
  }
}
