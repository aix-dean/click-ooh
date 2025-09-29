import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HomeIcon({
    super.key,
    this.size = 24,
    this.color = const Color(0xFF666666),
  });

  @override
  Widget build(BuildContext context) {
    final strokeWidth = (size * 0.08).clamp(1.0, double.infinity);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Roof
          Positioned(
            top: 0,
            child: SizedBox(
              width: size * 0.8,
              height: size * 0.2,
              child: CustomPaint(
                painter: TrianglePainter(color: color),
              ),
            ),
          ),
          // House body
          Positioned(
            bottom: 0,
            child: Container(
              width: size * 0.5,
              height: size * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: color, width: strokeWidth),
              ),
            ),
          ),
          // Door
          Positioned(
            bottom: strokeWidth,
            left: size * 0.325,
            child: Container(
              width: size * 0.15,
              height: size * 0.25,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}