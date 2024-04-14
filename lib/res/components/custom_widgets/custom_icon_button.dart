import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
