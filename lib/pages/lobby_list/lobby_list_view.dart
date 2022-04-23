import 'package:app/app.dart';
import 'package:app/pages/battle_room/battle_room_page.dart';
import 'package:app/pages/lobby_list/lobby_list_state.dart';
import 'package:app/pages/lobby_new/lobby_new.dart';
import 'package:app/widgets/safe.dart';
import 'package:flutter/material.dart';

class LobbyListView extends StatelessWidget {
  const LobbyListView({
    required this.state,
    Key? key,
  }) : super(key: key);

  final LobbyListState state;

  @override
  Widget build(BuildContext context) {
    return Safe(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppBar(
              title: Text('Lobby'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.lobbies.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.lobbies[index].name),
                  onTap: () => BattleRoomPage(state.lobbies[index].id).open(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => LobbyNewPage().open(),
        ),
      ),
    );
  }
}
