import 'package:app/app.dart';
import 'package:app/pages/lobby_list/lobby_list_page.dart';
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
          child: Text('Play Battleship'),
          onPressed: () => LobbyListPage().open(),
        ),
      ),
    );
  }
}
