import 'dart:math';

import 'package:app/pages/battle/battle_state.dart';
import 'package:app/widgets/safe.dart';
import 'package:flutter/material.dart';

class BattleView extends StatelessWidget {
  const BattleView({
    required this.state,
    Key? key,
  }) : super(key: key);

  final BattleState state;

  @override
  Widget build(BuildContext context) {
    return Safe(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game in progress'),
        ),
        body: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: state.width,
              height: state.height,
              child: GestureDetector(
                onTapUp: (d) => state.tapAt(d.localPosition),
                child: CustomPaint(
                  painter: BoardPainter(
                    isometric: state.isometric,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BoardPainter extends CustomPainter {
  BoardPainter({
    required this.isometric,
  });

  final Matrix4 isometric;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final pixels = min(size.width, size.height);
    const boardSize = 10;
    final boxSize = pixels / boardSize;

    canvas.transform(isometric.storage);

    for (var l = 0; l <= 10; l++) {
      canvas.drawLine(
        Offset(l * boxSize, 0),
        Offset(l * boxSize, pixels),
        line,
      );
      canvas.drawLine(
        Offset(0, l * boxSize),
        Offset(pixels, l * boxSize),
        line,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
