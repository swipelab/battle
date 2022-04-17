import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash(
    this.label, {
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
