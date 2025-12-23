import 'package:flutter/material.dart';

class CustomAppBarScreen extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Icon? customIcon;
  final Color? customColor;
  final eluvation;
  const CustomAppBarScreen({
    super.key,
    required this.title,
    this.customIcon,
    this.customColor,
    this.eluvation,
  });
  @override
  Size get preferredSize => Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }
}
