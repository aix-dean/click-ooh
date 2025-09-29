import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final double size;
  final Color color;

  const UserIcon({
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
          // Head
          Positioned(
            top: 0,
            child: Container(
              width: size * 0.35,
              height: size * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: strokeWidth),
              ),
            ),
          ),
          // Body
          Positioned(
            bottom: 0,
            child: Container(
              width: size * 0.2,
              height: size * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: color, width: strokeWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}