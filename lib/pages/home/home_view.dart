import 'package:app/app.dart';
import 'package:app/pages/lobby/lobby_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Lobby'),
          onPressed: () => LobbyPage().open(),
        ),
      ),
    );
  }
}