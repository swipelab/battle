

import 'package:app/pages/battle_room/battle_room_state.dart';
import 'package:app/widgets/safe.dart';
import 'package:flutter/material.dart';

class BattleRoomView extends StatelessWidget {
  const BattleRoomView({required this.state, Key? key}) : super(key: key);

  final BattleRoomState state;

  @override
  Widget build(BuildContext context) {
    return Safe(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Battle Room'),
        ),
        body: Center(
          child: Text(state.roomId),
        ),
      ),
    );
  }
}
