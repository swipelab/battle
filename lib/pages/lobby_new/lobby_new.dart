import 'package:flutter/material.dart';

class LobbyNewPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => LobbyNewView(),
      settings: this,
    );
  }
}

class LobbyNewView extends StatelessWidget {
  const LobbyNewView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('New Lobby'),
      ),
    );
  }
}
