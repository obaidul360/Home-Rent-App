import 'package:flutter/material.dart';

class CustomAppBarScreen extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBarScreen({super.key, required this.title});
  @override
  Size get preferredSize => Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title),);
  }
}
