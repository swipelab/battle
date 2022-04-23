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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset('assets/battleship.png'),
            SizedBox(height: 24),
            TextButton(
              child: Text('Play Battleship'),
              onPressed: () => LobbyListPage().open(),
            ),
          ],
        ),
      ),
    );
  }
}
