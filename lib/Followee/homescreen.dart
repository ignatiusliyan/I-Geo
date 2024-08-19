import 'package:flutter/material.dart';

class FolloweeDash extends StatefulWidget {
  const FolloweeDash({super.key});

  @override
  State<FolloweeDash> createState() => _FolloweeDashState();
}

class _FolloweeDashState extends State<FolloweeDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followee'),),
    );
  }
}
