import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  final Widget? label;
  final IconData? icon;
  final String text;
  final VoidCallback? onTap;
  const NavigatorWidget({
    super.key,
    this.label,
    this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 44,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox.shrink(),
            label ??
                Icon(
                  icon ?? Icons.send,
                  color: Color.fromARGB(255, 190, 190, 190),
                ),
            Text(
              text,
              style: TextStyle(color: Color.fromARGB(255, 190, 190, 190)),
            ),
          ],
        ),
      ),
    );
  }
}
