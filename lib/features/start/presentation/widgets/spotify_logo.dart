import 'package:flutter/material.dart';

class SpotifyLogo extends StatelessWidget {
  final double diameter;
  const SpotifyLogo({super.key, required this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: SizedBox(
        height: diameter * 0.54,
        width: diameter * 0.74,
        child: CustomPaint(
          painter: _SpotifyGlyphPainter(),
        ),
      ),
    );
  }
}

class _SpotifyGlyphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * 0.16;

    void arc(double yFactor, double bend) {
      final y = size.height * yFactor;
      final start = Offset(size.width * 0.06, y);
      final control = Offset(size.width * 0.52, y - size.height * bend);
      final end = Offset(size.width * 0.94, y);
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);
      canvas.drawPath(path, paint);
    }

    arc(0.30, 0.22);
    arc(0.54, 0.16);
    arc(0.78, 0.10);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
