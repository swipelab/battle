import 'package:flutter/cupertino.dart';

class BattleState {
  BattleState({
    required this.width,
    required this.height,
    required this.tapAt,
    required this.isometric,
    required this.boardSize,
    required this.unitSize,
  });

  final int boardSize;
  final double unitSize;
  final double width;
  final double height;
  final Matrix4 isometric;
  final void Function(Offset) tapAt;
}
