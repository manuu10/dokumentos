// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AngledContainer extends StatelessWidget {
  const AngledContainer({
    Key? key,
    this.backgroundColor,
    this.gradient,
    this.borderWidth = 0,
    this.borderInset = 7,
    this.borderTop = false,
    this.borderLeft = false,
    this.borderBottom = false,
    this.borderRight = false,
    this.angleTopRight = true,
    this.angleTopLeft = true,
    this.angleBottomLeft = true,
    this.angelBottomRight = true,
    this.borderColor,
    required this.child,
  }) : super(key: key);
  final Color? backgroundColor;
  final Gradient? gradient;
  final double borderWidth;
  final double borderInset;
  final bool borderTop;
  final bool borderLeft;
  final bool borderBottom;
  final bool borderRight;
  final bool angleTopRight;
  final bool angleTopLeft;
  final bool angleBottomLeft;
  final bool angelBottomRight;
  final Color? borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: borderLeft ? borderWidth : 0,
        right: borderRight ? borderWidth : 0,
        top: borderTop ? borderWidth : 0,
        bottom: borderBottom ? borderWidth : 0,
      ),
      child: CustomPaint(
        painter: CustomAngledPainter(
          inset: borderInset,
          borderColor: borderColor,
          borderBottom: borderBottom,
          borderLeft: borderLeft,
          borderRight: borderRight,
          borderTop: borderTop,
          topLeft: angleTopLeft,
          topRight: angleTopRight,
          bottomLeft: angleBottomLeft,
          bottomRight: angelBottomRight,
          width: borderWidth,
        ),
        child: ClipPath(
          clipper: CustomAngledClipper(
              inset: borderInset,
              topLeft: angleTopLeft,
              topRight: angleTopRight,
              bottomLeft: angleBottomLeft,
              bottomRight: angelBottomRight),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: gradient,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Used to clip content inside the angled border
class CustomAngledClipper extends CustomClipper<Path> {
  final double inset;
  final bool topLeft;
  final bool bottomLeft;
  final bool bottomRight;
  final bool topRight;
  CustomAngledClipper({
    required this.inset,
    this.topLeft = true,
    this.bottomLeft = true,
    this.bottomRight = true,
    this.topRight = true,
  });
  @override
  Path getClip(Size size) {
    final path = AngleClipperRaw.getTopLeftCorner(size, topLeft ? inset : 0);
    path.extendWithPath(
      AngleClipperRaw.getBottomLeftCorner(size, bottomLeft ? inset : 0),
      Offset.zero,
    );
    path.extendWithPath(
      AngleClipperRaw.getBottomRightCorner(size, bottomRight ? inset : 0),
      Offset.zero,
    );
    path.extendWithPath(
      AngleClipperRaw.getTopRightCorner(size, topRight ? inset : 0),
      Offset.zero,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// Used to created the angled border around the box
class CustomAngledPainter extends CustomPainter {
  final Color? borderColor;
  final double width;
  final double inset;
  final bool borderTop;
  final bool borderLeft;
  final bool borderBottom;
  final bool borderRight;
  final bool topLeft;
  final bool bottomLeft;
  final bool bottomRight;
  final bool topRight;

  late final Paint _paintBorder;

  CustomAngledPainter({
    required this.width,
    required this.inset,
    this.borderColor,
    this.borderTop = false,
    this.borderBottom = false,
    this.borderLeft = false,
    this.borderRight = false,
    this.topLeft = true,
    this.bottomLeft = true,
    this.bottomRight = true,
    this.topRight = true,
  }) {
    _paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..color = borderColor ?? Colors.transparent
      ..strokeWidth = width
      ..strokeJoin = StrokeJoin.bevel;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (width <= 0 ||
        borderColor == null ||
        borderColor == Colors.transparent ||
        (!borderBottom && !borderLeft && !borderRight && !borderTop)) return;
    final topLeftC =
        AngleClipperRaw.getTopLeftCorner(size, topLeft ? inset : 0);
    final bottomLeftC =
        AngleClipperRaw.getBottomLeftCorner(size, bottomLeft ? inset : 0);
    final bottomRightC =
        AngleClipperRaw.getBottomRightCorner(size, bottomRight ? inset : 0);
    final topRightC =
        AngleClipperRaw.getTopRightCorner(size, topRight ? inset : 0);

    if (borderTop) {
      final p = Path.from(topRightC);
      p.extendWithPath(topLeftC, Offset.zero);
      canvas.drawPath(p, _paintBorder);
    }
    if (borderLeft) {
      final p = Path.from(topLeftC);
      p.extendWithPath(bottomLeftC, Offset.zero);
      canvas.drawPath(p, _paintBorder);
    }
    if (borderBottom) {
      final p = Path.from(bottomLeftC);
      p.extendWithPath(bottomRightC, Offset.zero);
      canvas.drawPath(p, _paintBorder);
    }
    if (borderRight) {
      final p = Path.from(bottomRightC);
      p.extendWithPath(topRightC, Offset.zero);
      canvas.drawPath(p, _paintBorder);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/// All Path are directed in counter-clockwise rotation
abstract class AngleClipperRaw {
  /// All Path are directed in counter-clockwise rotatin
  ///  < < < <
  /// v       ^
  /// v       ^
  /// v       ^
  ///  > > > >

  ///directed in counter-clockwise rotation
  static Offset topLeftEdgeTop(Size size, double inset) => Offset(inset, 0);

  ///directed in counter-clockwise rotation
  static Offset topLeftEdgeLeft(Size size, double inset) => Offset(0, inset);

  ///directed in counter-clockwise rotation
  static Offset bottomLeftEdgeLeft(Size size, double inset) =>
      Offset(0, size.height - inset);

  ///directed in counter-clockwise rotation
  static Offset bottomLeftEdgeBottom(Size size, double inset) =>
      Offset(inset, size.height);

  ///directed in counter-clockwise rotation
  static Offset topRightEdgeTop(Size size, double inset) =>
      Offset(size.width - inset, 0);

  ///directed in counter-clockwise rotation
  static Offset topRightEdgeRight(Size size, double inset) =>
      Offset(size.width, inset);

  ///directed in counter-clockwise rotation
  static Offset bottomRightEdgeRight(Size size, double inset) =>
      Offset(size.width, size.height - inset);

  ///directed in counter-clockwise rotation
  static Offset bottomRightEdgeBottom(Size size, double inset) =>
      Offset(size.width - inset, size.height);

  ///directed in counter-clockwise rotation
  static Path getTopLeftCorner(Size size, double inset) {
    if (inset == 0) return Path()..moveTo(0, 0);
    final start = topLeftEdgeTop(size, inset);
    final end = topLeftEdgeLeft(size, inset);

    return Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
  }

  ///directed in counter-clockwise rotation
  static Path getBottomLeftCorner(Size size, double inset) {
    if (inset == 0) return Path()..moveTo(0, size.height);
    final start = bottomLeftEdgeLeft(size, inset);
    final end = bottomLeftEdgeBottom(size, inset);

    return Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
  }

  ///directed in counter-clockwise rotation
  static Path getBottomRightCorner(Size size, double inset) {
    if (inset == 0) return Path()..moveTo(size.width, size.height);
    final start = bottomRightEdgeBottom(size, inset);
    final end = bottomRightEdgeRight(size, inset);

    return Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
  }

  ///directed in counter-clockwise rotation
  static Path getTopRightCorner(Size size, double inset) {
    if (inset == 0) return Path()..moveTo(size.width, 0);
    final start = topRightEdgeRight(size, inset);
    final end = topRightEdgeTop(size, inset);

    return Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
  }

  ///directed in counter-clockwise rotation
  static Path getLeftEdge(Size size, double inset) {
    final topLeft = getTopLeftCorner(size, inset);
    final bottomLeft = getBottomLeftCorner(size, inset);
    topLeft.extendWithPath(bottomLeft, Offset.zero);
    return topLeft;
  }

  ///directed in counter-clockwise rotation
  static Path getRightEdge(Size size, double inset) {
    final bottomRight = getBottomRightCorner(size, inset);
    final topRight = getTopRightCorner(size, inset);
    bottomRight.extendWithPath(topRight, Offset.zero);
    return bottomRight;
  }
}
