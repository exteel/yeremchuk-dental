import 'package:flutter/material.dart';

/// Renders the official multicolor Google "G" mark (24x24 viewBox).
class GoogleLogo extends StatelessWidget {
  const GoogleLogo({this.size = 20, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  static const _blue = Color(0xFF4285F4);
  static const _green = Color(0xFF34A853);
  static const _yellow = Color(0xFFFBBC05);
  static const _red = Color(0xFFEA4335);

  static final _bluePath = Path()
    ..moveTo(23.745, 12.27)
    ..cubicTo(23.745, 11.48, 23.675, 10.73, 23.555, 10)
    ..lineTo(12.255, 10)
    ..lineTo(12.255, 14.51)
    ..lineTo(18.725, 14.51)
    ..cubicTo(18.435, 15.99, 17.585, 17.24, 16.325, 18.09)
    ..lineTo(16.325, 21.09)
    ..lineTo(20.185, 21.09)
    ..cubicTo(22.445, 19.04, 23.745, 15.92, 23.745, 12.27)
    ..close();

  static final _greenPath = Path()
    ..moveTo(12.255, 24)
    ..cubicTo(15.495, 24, 18.205, 22.92, 20.185, 21.09)
    ..lineTo(16.325, 18.09)
    ..cubicTo(15.245, 18.81, 13.875, 19.25, 12.255, 19.25)
    ..cubicTo(9.125, 19.25, 6.475, 17.14, 5.525, 14.29)
    ..lineTo(1.545, 14.29)
    ..lineTo(1.545, 17.38)
    ..cubicTo(3.515, 21.3, 7.565, 24, 12.255, 24)
    ..close();

  static final _yellowPath = Path()
    ..moveTo(5.525, 14.29)
    ..cubicTo(5.275, 13.57, 5.145, 12.8, 5.145, 12)
    ..cubicTo(5.145, 11.20, 5.285, 10.43, 5.525, 9.71)
    ..lineTo(5.525, 6.62)
    ..lineTo(1.545, 6.62)
    ..arcToPoint(
      const Offset(1.545, 17.38),
      radius: const Radius.circular(11.86),
    )
    ..lineTo(5.525, 14.29)
    ..close();

  static final _redPath = Path()
    ..moveTo(12.255, 4.75)
    ..cubicTo(14.025, 4.75, 15.605, 5.36, 16.855, 6.55)
    ..lineTo(20.275, 3.13)
    ..cubicTo(18.205, 1.19, 15.495, 0, 12.255, 0)
    ..cubicTo(7.565, 0, 3.515, 2.7, 1.545, 6.62)
    ..lineTo(5.525, 9.71)
    ..cubicTo(6.475, 6.86, 9.125, 4.75, 12.255, 4.75)
    ..close();

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..scale(size.width / 24, size.height / 24)
      ..drawPath(_bluePath, Paint()..color = _blue)
      ..drawPath(_greenPath, Paint()..color = _green)
      ..drawPath(_yellowPath, Paint()..color = _yellow)
      ..drawPath(_redPath, Paint()..color = _red)
      ..restore();
  }

  @override
  bool shouldRepaint(covariant _GoogleLogoPainter oldDelegate) => false;
}
