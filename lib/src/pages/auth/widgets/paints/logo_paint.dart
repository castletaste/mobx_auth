import 'package:flutter/rendering.dart';

class LogoCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.2656250);
    path_0.cubicTo(
        size.width * 0.5000000,
        size.height * 0.3950667,
        size.width * 0.3972082,
        size.height * 0.5000000,
        size.width * 0.2704082,
        size.height * 0.5000000);
    path_0.lineTo(size.width * 0.04081633, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.04081633, size.height * 0.2656250);
    path_0.cubicTo(
        size.width * 0.04081633,
        size.height * 0.1361831,
        size.width * 0.1436080,
        size.height * 0.03125000,
        size.width * 0.2704082,
        size.height * 0.03125000);
    path_0.cubicTo(
        size.width * 0.3972082,
        size.height * 0.03125000,
        size.width * 0.5000000,
        size.height * 0.1361831,
        size.width * 0.5000000,
        size.height * 0.2656250);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff17CF97).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.7343750);
    path_1.cubicTo(
        size.width * 0.5000000,
        size.height * 0.6049333,
        size.width * 0.6027918,
        size.height * 0.5000000,
        size.width * 0.7295918,
        size.height * 0.5000000);
    path_1.lineTo(size.width * 0.9591837, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.9591837, size.height * 0.7343750);
    path_1.cubicTo(
        size.width * 0.9591837,
        size.height * 0.8638167,
        size.width * 0.8563918,
        size.height * 0.9687500,
        size.width * 0.7295918,
        size.height * 0.9687500);
    path_1.cubicTo(
        size.width * 0.6027918,
        size.height * 0.9687500,
        size.width * 0.5000000,
        size.height * 0.8638167,
        size.width * 0.5000000,
        size.height * 0.7343750);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff17CF97).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.04081633, size.height * 0.7343750);
    path_2.cubicTo(
        size.width * 0.04081633,
        size.height * 0.8638167,
        size.width * 0.1436080,
        size.height * 0.9687500,
        size.width * 0.2704082,
        size.height * 0.9687500);
    path_2.lineTo(size.width * 0.5000000, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.5000000, size.height * 0.7343750);
    path_2.cubicTo(
        size.width * 0.5000000,
        size.height * 0.6049333,
        size.width * 0.3972082,
        size.height * 0.5000000,
        size.width * 0.2704082,
        size.height * 0.5000000);
    path_2.cubicTo(
        size.width * 0.1436080,
        size.height * 0.5000000,
        size.width * 0.04081633,
        size.height * 0.6049333,
        size.width * 0.04081633,
        size.height * 0.7343750);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff17CF97).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.9591837, size.height * 0.2656250);
    path_3.cubicTo(
        size.width * 0.9591837,
        size.height * 0.1361831,
        size.width * 0.8563918,
        size.height * 0.03125000,
        size.width * 0.7295918,
        size.height * 0.03125000);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.03125000);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.2656250);
    path_3.cubicTo(
        size.width * 0.5000000,
        size.height * 0.3950667,
        size.width * 0.6027918,
        size.height * 0.5000000,
        size.width * 0.7295918,
        size.height * 0.5000000);
    path_3.cubicTo(
        size.width * 0.8563918,
        size.height * 0.5000000,
        size.width * 0.9591837,
        size.height * 0.3950667,
        size.width * 0.9591837,
        size.height * 0.2656250);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff17CF97).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
