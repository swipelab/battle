import 'dart:math';

import 'package:app/pages/battle/battle_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:stated/stated.dart';

class BattleBloc extends Stated<BattleState> {
  BattleBloc({
    required this.roomId,
    this.boardSize = 10,
    this.width = 600,
    this.height = 600,
  });

  final String roomId;
  final int boardSize;
  final double width;
  final double height;
  final List<Tile> tiles = [];
  final TransformationController _transformController =
      TransformationController();

  double get size => min(width, height);

  double get unitSize => size / boardSize;

  void _tapAt(Offset viewportPoint) {
    final scenePoint = _transformController.toScene(viewportPoint);
    final position = Position(x: scenePoint.dx, y: scenePoint.dy);
    tiles.add(Tile(position: position));
    if (tiles.length > 20) {
      tiles.removeRange(0, tiles.length - 20);
    }
    setState();
  }

  Matrix4 get _isometric {
    return Matrix4.identity()
      //..translate(width / 2, 0)
      ..scale(0.93, 1)
      ..rotateX(45 * pi / 180)
      ..rotateZ(45 * pi / 180);
  }

  @override
  BattleState build() {
    return BattleState(
      width: width,
      height: height,
      tapAt: _tapAt,
      boardSize: boardSize,
      unitSize: unitSize,
      isometric: _isometric,
      tiles: tiles,
      transformController: _transformController,
    );
  }
}
