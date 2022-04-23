import 'package:app/models/models.dart';
import 'package:app/pages/lobby_list/lobby_list_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stated/stated.dart';

class LobbyListBloc extends Stated<LobbyListState> with Disposer {
  LobbyListBloc() {
    final lobbies = FirebaseFirestore.instance
        .collection('lobby')
        .withConverter<Lobby>(
          fromFirestore: (e, _) {
            final d = e.data()!;
            return Lobby(
              id: e.id,
              name: d['name'],
              isLocked: d['isLocked'] ?? true,
              maxPlayers: d['maxPlayers'] ?? 0,
            );
          },
          toFirestore: (e, _) => {
            'name': e.name,
            'isLocked': e.isLocked,
            'maxPlayers': e.maxPlayers,
          },
        )
        .snapshots();

    final subscription = lobbies.listen((e) {
      _lobbies = e.docs.map((e) => e.data()).toList();
      setState();
    });

    addDispose(() => subscription.cancel());
  }

  List<Lobby> _lobbies = [];

  @override
  LobbyListState build() {
    return LobbyListState(
      lobbies: _lobbies,
    );
  }
}
