import 'package:flutter/material.dart';

class GymPage extends StatelessWidget {
  const GymPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GYM'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: ListView(
          children: [],
        ));
  }
}
