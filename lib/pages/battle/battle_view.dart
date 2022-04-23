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
                        tiles: state.tiles,
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
    required this.tiles,
  });

  final List<Tile> tiles;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Color(0xFF92A2A8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const pixels = 600.0;
    const boardSize = 10;
    const boxSize = pixels / boardSize;
    const half = boxSize / 2;

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

    for (var e in tiles) {
      canvas.drawCircle(
        Offset(
          e.position.x * boxSize + half,
          e.position.y * boxSize + half,
        ),
        boxSize / 2,
        line,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
