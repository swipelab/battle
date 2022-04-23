import 'package:app/widgets/safe.dart';
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
    return Safe(
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Lobby'),
        ),
        body: Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
