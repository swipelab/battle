import 'package:app/models/models.dart';
import 'package:app/pages/lobby_list/lobby_list_state.dart';
import 'package:app/services/firebase.dart';
import 'package:stated/stated.dart';

class LobbyListBloc extends Stated<LobbyListState> with Disposer {
  LobbyListBloc({
    required Firebase firebase,
  }) {
    _lobbies = firebase.lobbies;
    _lobbies.subscribe(setState).disposeBy(this);
  }

  late final ObservableList<Lobby> _lobbies;

  @override
  LobbyListState build() {
    return LobbyListState(
      lobbies: _lobbies,
    );
  }
}
