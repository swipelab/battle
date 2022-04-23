import 'package:flutter/cupertino.dart';

class Tile {
  Tile({
    required this.position,
  });

  final Position position;
}

class Position {
  Position({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;
}

class BattleState {
  BattleState({
    required this.width,
    required this.height,
    required this.tapAt,
    required this.isometric,
    required this.boardSize,
    required this.unitSize,
    required this.tiles,
    required this.transformController,
  });

  final int boardSize;
  final double unitSize;
  final double width;
  final double height;
  final Matrix4 isometric;
  final void Function(Offset) tapAt;
  final List<Tile> tiles;
  final TransformationController transformController;
}
