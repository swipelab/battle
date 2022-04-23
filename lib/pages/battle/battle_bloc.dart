import 'package:app/pages/battle/battle_state.dart';
import 'package:stated/stated.dart';

class BattleBloc extends Stated<BattleState> {
  BattleBloc({
    required this.roomId,
  });

  final String roomId;

  @override
  BattleState build() {
    return BattleState();
  }
}
