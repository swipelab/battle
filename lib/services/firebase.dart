import 'package:app/firebase_options.dart';
import 'package:app/models/lobby.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:firebase_core/firebase_core.dart' as fire;
import 'package:stated/stated.dart';

class Firebase extends Disposable with AsyncInit, Disposer {
  static Future<Firebase> create(Resolver resolver) async => Firebase();

  @override
  Future<void> init() async {
    await fire.Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  ObservableList<Lobby>? _lobbies;

  ObservableList<Lobby> get lobbies => _lobbies ??= _linkLobbies();

  ObservableList<Lobby> _linkLobbies() {
    final observable = ObservableList<Lobby>();

    final collection = fire.FirebaseFirestore.instance
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

    final subscription = collection.listen((e) {
      observable.replaceWith(e.docs.map((e) => e.data()));
    });
    addDispose(() => subscription.cancel());
    return observable;
  }
}
