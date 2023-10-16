import 'package:flutter/rendering.dart';

class BackgroundCustomPainter extends CustomPainter {
  const BackgroundCustomPainter({
    required this.fillColor,
  });

  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9985775);
    path_0.lineTo(size.width * 0.01225626, size.height * 0.9985775);
    path_0.cubicTo(
        size.width * 0.01486154,
        size.height * 0.9960039,
        size.width * 0.01779405,
        size.height * 0.9940853,
        size.width * 0.02096538,
        size.height * 0.9929806);
    path_0.lineTo(size.width * 0.4410256, size.height * 0.8468992);
    path_0.lineTo(size.width * 0.6038462, size.height * 0.7848837);
    path_0.lineTo(size.width * 0.6767282, size.height * 0.7568411);
    path_0.cubicTo(
        size.width * 0.7214308,
        size.height * 0.7396395,
        size.width * 0.7682846,
        size.height * 0.7397946,
        size.width * 0.8129385,
        size.height * 0.7572946);
    path_0.lineTo(size.width * 0.8319154, size.height * 0.7647326);
    path_0.cubicTo(
        size.width * 0.8656103,
        size.height * 0.7779380,
        size.width * 0.8964385,
        size.height * 0.8042132,
        size.width * 0.9213538,
        size.height * 0.8409535);
    path_0.cubicTo(
        size.width * 0.9310256,
        size.height * 0.8552171,
        size.width * 0.9397154,
        size.height * 0.8709225,
        size.width * 0.9472897,
        size.height * 0.8878372);
    path_0.lineTo(size.width * 0.9940692, size.height * 0.9922791);
    path_0.cubicTo(
        size.width * 0.9949744,
        size.height * 0.9942984,
        size.width * 0.9957795,
        size.height * 0.9964031,
        size.width * 0.9964846,
        size.height * 0.9985775);
    path_0.lineTo(size.width, size.height * 0.9985775);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = fillColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
