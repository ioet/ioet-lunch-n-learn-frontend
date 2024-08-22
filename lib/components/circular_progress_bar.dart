import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgressBar extends StatelessWidget {
  final double value;
  final int totalValue;
  final Color color;

  const CircularProgressBar(
      {super.key,
      required this.value,
      required this.totalValue,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularProgressBarPainter(value, color),
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: Container(
          alignment: Alignment.center,
          /* decoration: BoxDecoration(
              color: Color.fromRGBO(46, 46, 46, 1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(100))), */
          child: Text(
            totalValue.toString(),
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Gobold Bold"),
          ),
        ),
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double value;
  final Color color;

  CircularProgressBarPainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint baseCircle = Paint()
      ..color = const Color.fromRGBO(46, 46, 46, 1)
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke;

    Paint progressCircle = Paint()
      ..shader = LinearGradient(
        colors: [color, Colors.orange],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2))
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 10;

    canvas.drawCircle(center, radius, baseCircle);

    double angle = 2 * pi * value;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, progressCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
