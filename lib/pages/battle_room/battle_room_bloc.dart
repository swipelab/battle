
import 'package:app/pages/battle_room/battle_room_state.dart';
import 'package:app/services/firebase.dart';
import 'package:stated/stated.dart';

class BattleRoomBloc extends Stated<BattleRoomState> {
  BattleRoomBloc({
    required Firebase firebase,
    required this.roomId,
  });

  final String roomId;

  @override
  BattleRoomState build() {
    return BattleRoomState(
      roomId: roomId,
    );
  }
}