import 'package:flutter/material.dart';

class VectorsScreen extends StatefulWidget {
  const VectorsScreen({super.key});

  @override
  State<VectorsScreen> createState() => _VectorsScreenState();
}

class _VectorsScreenState extends State<VectorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Vectors"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomPaint(
            painter: XLine(),
          )
        ],
      ),
    ));
  }
}

class XLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    final triangle = Path();
    triangle.moveTo(150, 0);
    triangle.relativeLineTo(100, 100);
    triangle.relativeLineTo(-150, 0);
    triangle.close();

    final square1 = Path();
    square1.moveTo(50, 150);
    square1.relativeLineTo(100, 0);
    square1.relativeLineTo(0, 100);
    square1.relativeLineTo(-100, 0);
    square1.close();

    final star = Path();
    star.moveTo(250, 150);
    star.relativeLineTo(50, 50);
    star.moveTo(252, 150);
    star.relativeLineTo(-50, 50);
    star.moveTo(299, 200);
    star.relativeLineTo(50, 0);
    star.relativeLineTo(-50, 50);
    star.relativeLineTo(50, 50);
    star.relativeLineTo(-100, -20);
    star.moveTo(203, 200);
    star.relativeLineTo(-50, 0);
    star.relativeLineTo(50, 50);
    star.relativeLineTo(-50, 50);
    star.relativeLineTo(100, -20);
    

    canvas.drawPath(triangle, paint);
    canvas.drawPath(square1, paint);
    canvas.drawPath(star, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
