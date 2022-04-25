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
          child: Transform(
            transform: state.isometric,
            alignment: FractionalOffset.center,
            filterQuality: FilterQuality.high,
            child: GestureDetector(
              onTapDown: (d) => state.tapAt(d.localPosition),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox.square(
                  dimension: 600,
                  child: Container(
                    color: Color(0x242A6076),
                    child: CustomPaint(
                      painter: BoardPainter(
                        state: state,
                      ),
                    ),
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
    required this.state,
  });

  final BattleState state;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Color(0xFF92A2A8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final shipLine = Paint()
      ..color = Color(0xFFEFE9E9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final shipFill = Paint()
      ..color = Color(0xFFF18B8B)
      ..style = PaintingStyle.fill;

    final half = state.unitSize / 2;

    for (var l = 0; l <= 10; l++) {
      canvas.drawLine(
        Offset(l * state.unitSize, 0),
        Offset(l * state.unitSize, state.size),
        line,
      );
      canvas.drawLine(
        Offset(0, l * state.unitSize),
        Offset(state.size, l * state.unitSize),
        line,
      );
    }

    for (var e in state.ships) {
      final rect = Rect.fromLTRB(
          e.head.x * state.unitSize,
          e.head.y * state.unitSize,
          (e.tail.x + 1) * state.unitSize,
          (e.tail.y + 1) * state.unitSize);
      canvas.drawRect(rect, shipFill);
      canvas.drawRect(rect, shipLine);
    }

    for (var e in state.tiles) {
      canvas.drawCircle(
        Offset(
          e.position.x * state.unitSize + half,
          e.position.y * state.unitSize + half,
        ),
        half,
        line,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
