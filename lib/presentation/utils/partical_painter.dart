import 'package:flutter/material.dart';

class ParticlesPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  ParticlesPainter({
    required this.animation,
    required this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Créer des particules flottantes
    for (int i = 0; i < 20; i++) {
      final double x =
          (size.width * (i * 0.1 + 0.1)) + (50 * (animation.value * 2 - 1));
      final double y =
          (size.height * (i * 0.05 + 0.1)) + (30 * (animation.value * 2 - 1));

      final double radius = 2 + (animation.value * 3);

      canvas.drawCircle(
        Offset(x % size.width, y % size.height),
        radius,
        paint,
      );
    }

    // Ajouter des lignes de connexion subtiles
    final linePaint = Paint()
      ..color = color.withOpacity(0.1)
      ..strokeWidth = 1;

    for (int i = 0; i < 5; i++) {
      final startX = size.width * (i * 0.2);
      final startY = size.height * 0.3;
      final endX = size.width * (i * 0.2 + 0.1);
      final endY = size.height * 0.7;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
