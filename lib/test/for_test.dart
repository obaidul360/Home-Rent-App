import 'package:flutter/material.dart';

class ForTest extends StatefulWidget {
  const ForTest({super.key});

  @override
  State<ForTest> createState() => _ForTestState();
}

class _ForTestState extends State<ForTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("For Test")));
  }
}
