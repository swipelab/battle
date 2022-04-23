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
      child: Theme(
        data: ThemeData(
          brightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Game in progress'),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  foregroundPainter: BoardPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final boardLine = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), boardLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
