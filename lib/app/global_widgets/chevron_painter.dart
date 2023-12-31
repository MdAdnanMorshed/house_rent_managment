
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_management/app/core/values/app_colors.dart';

class Chevron extends CustomPainter {
  final List<Color> colors = [
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.purple,
  ];
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.primaryColor,
       // Color(0xFFF1EDED),
        AppColors.red.withOpacity(0.5),
      ],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, 0);
    path.lineTo(size.width / 1, size.height - size.height / 12);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}