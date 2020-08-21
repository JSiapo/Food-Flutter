import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  final double height;
  HeaderCurvo(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    lapiz.color = Colors.amber[700];
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    // lapiz.strokeWidth = 10;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.3, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
