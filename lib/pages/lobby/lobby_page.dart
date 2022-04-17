import 'package:flutter/material.dart';

class LobbyPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => LobbyView(),
      settings: this,
    );
  }
}

class LobbyView extends StatelessWidget {
  const LobbyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Lobby'),
      ),
    );
  }
}
