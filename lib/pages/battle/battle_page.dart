import 'package:app/pages/battle/battle_bloc.dart';
import 'package:app/pages/battle/battle_state.dart';
import 'package:app/pages/battle/battle_view.dart';
import 'package:flutter/material.dart';
import 'package:stated/stated.dart';

class BattlePage extends Page<void> {
  const BattlePage({
    required this.roomId,
  });

  final String roomId;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => StatedBuilder<BattleState>(
        key: ObjectKey(roomId),
        create: (context) => BattleBloc(
          roomId: roomId,
        ),
        builder: (context, state, _) => BattleView(state: state),
      ),
      settings: this,
    );
  }
}
