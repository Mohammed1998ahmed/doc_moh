import 'dart:io';
import 'dart:math';
import 'package:doctor/component/conset/Const.dart';
import 'package:flutter/material.dart';
 
// ignore: must_be_immutable
class HexagonImage extends StatefulWidget {
  final double size;
  final String? imageUrl;
  final String? imageProfile;
  File? selectedImage1;
  HexagonImage(
      {required this.size,
      this.imageUrl,
      this.selectedImage1,
      this.imageProfile});

  @override
  State<HexagonImage> createState() => _HexagonImageState();
}

class _HexagonImageState extends State<HexagonImage> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.size, widget.size),
      painter: _HexagonPainter(),
      // ignore: unnecessary_null_comparison
      child: ClipPath(
        clipper: _HexagonClipper(),
        child: widget.selectedImage1 != null
            ? Image.file(
                widget.selectedImage1!,
                fit: BoxFit.cover,
              )
            : widget.imageUrl != null
                ? Image.network(
                    widget.imageUrl!,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    ImagesPath + widget.imageProfile!,
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // رسم الشكل السداسي هنا، يمكنك استخدام الكود السابق
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));

    for (var i = 1; i <= 6; i++) {
      final angle = 2.0 * pi * i / 6;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
