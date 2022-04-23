import 'package:app/app.dart';
import 'package:app/pages/battle/battle_page.dart';
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
        child: InkWell(
          onTap: () => BattlePage(roomId: 'SZVsTO0FAsGO0VQt7W4H').open(),
          child: Column(
            children: [
              Image.asset('assets/battleship.png'),
              SizedBox(height: 24),
              Text('Play Battleship'),
            ],
          ),
        ),
      ),
    );
  }
}
