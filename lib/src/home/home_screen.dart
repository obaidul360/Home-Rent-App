import 'package:flutter/material.dart';

import '../appbar/appbar_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarScreen(
        title: 'House',
        action: [Icon(Icons.notification_add, size: 30)],
      ),
      body: Column(children: [
        Text("House"),
        Text("House"),
        Text("House"),
        Text("House"),
        Text("House"),
        Text("Flat"),
        Text("Hottle"),
        Text("Sunrise"),
      ],),
    );
  }
}
