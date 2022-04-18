import 'package:app/app.dart';
import 'package:app/pages/lobby_list/lobby_list_state.dart';
import 'package:app/pages/lobby_new/lobby_new.dart';
import 'package:flutter/material.dart';

class LobbyListView extends StatelessWidget {
  const LobbyListView({
    required this.state,
    Key? key,
  }) : super(key: key);

  final LobbyListState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBar(
                  title: Text('Lobby'),
                  toolbarHeight: 64,
                  actions: [
                    TextButton(
                      onPressed: () => LobbyNewPage().open(),
                      child: Text(
                        '+ New Lobby',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.lobbies.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.lobbies[index].name),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
