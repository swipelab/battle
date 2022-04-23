import 'dart:math';

import 'package:app/pages/battle/battle_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:stated/stated.dart';

class BattleBloc extends Stated<BattleState> {
  BattleBloc({
    required this.roomId,
    this.boardSize = 10,
    this.width = 800,
    this.height = 600,
  });

  final String roomId;
  final int boardSize;
  final double width;
  final double height;

  void _tapAt(Offset position) {}

  Matrix4 get _isometric {
    return Matrix4.identity()
      ..translate(width / 2, 0)
      ..scale(0.93, 1)
      ..rotateX(45 * pi / 180)
      ..rotateZ(45 * pi / 180);
  }

  @override
  BattleState build() {
    final size = min(width, height);

    return BattleState(
      width: width,
      height: height,
      tapAt: _tapAt,
      boardSize: boardSize,
      unitSize: size / boardSize,
      isometric: _isometric,
    );
  }
}
