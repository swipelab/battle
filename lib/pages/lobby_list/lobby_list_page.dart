import 'package:app/pages/lobby_list/lobby_list_bloc.dart';
import 'package:app/pages/lobby_list/lobby_list_state.dart';
import 'package:app/pages/lobby_list/lobby_list_view.dart';
import 'package:flutter/material.dart';
import 'package:stated/stated.dart';

class LobbyListPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => StatedBuilder<LobbyListState>(
        create: (_) => LobbyListBloc(),
        builder: (context, state, _) => LobbyListView(state: state),
      ),
      settings: this,
    );
  }
}
