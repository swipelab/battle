
import 'package:app/pages/battle_room/battle_room_state.dart';
import 'package:stated/stated.dart';

class BattleRoomBloc extends Stated<BattleRoomState> {
  BattleRoomBloc({
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