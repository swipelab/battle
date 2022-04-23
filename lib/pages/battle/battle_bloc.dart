import 'package:app/pages/battle/battle_state.dart';
import 'package:stated/stated.dart';

class BattleBloc extends Stated<BattleState> {
  @override
  BattleState build() {
    return BattleState();
  }
}
