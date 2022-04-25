import 'package:flutter/cupertino.dart';

class Tile {
  Tile({
    required this.position,
  });

  final Position position;
}

class Ship {
  Ship({
    required this.head,
    required this.tail,
  });

  final Position head;
  final Position tail;
}

class Position {
  Position(this.x, this.y);

  final double x;
  final double y;
}

class BattleState {
  BattleState({
    required this.size,
    required this.width,
    required this.height,
    required this.tapAt,
    required this.isometric,
    required this.grid,
    required this.unitSize,
    required this.tiles,
    required this.ships,
  });

  final int grid;
  final double unitSize;
  final double size;
  final double width;
  final double height;
  final Matrix4 isometric;
  final void Function(Offset) tapAt;
  final List<Tile> tiles;
  final List<Ship> ships;
}
