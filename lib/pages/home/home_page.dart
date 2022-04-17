import 'package:app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => const HomeView(),
      settings: this,
    );
  }
}
