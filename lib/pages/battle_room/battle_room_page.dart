import 'package:app/app.dart';
import 'package:app/pages/battle_room/battle_room_bloc.dart';
import 'package:app/pages/battle_room/battle_room_state.dart';
import 'package:app/pages/battle_room/battle_room_view.dart';
import 'package:flutter/material.dart';
import 'package:stated/stated.dart';

class BattleRoomPage extends Page<void> {
  const BattleRoomPage(
    this.roomId,
  );

  final String roomId;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => ListenableBuilder<BattleRoomBloc>(
        create: (_) => BattleRoomBloc(
          firebase: App.get(),
          roomId: roomId,
        ),
        builder: (context, bloc, _) => BattleRoomView(
          state: bloc.value,
        ),
      ),
      settings: this,
    );
  }
}
