import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class AppBarBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 218 / 360, size.height * 149 / 299),
        Offset(size.width * (-78) / 360, size.height * 149 / 299),
        [const Color(0xff3D579D), const Color(0xff001422)],
        [0, 1]);
    canvas.drawRect(
        Rect.fromLTWH(
            0, size.height * 4.082609e-7, size.width, size.height * 0.9966555),
        paint0Fill);

    // Second Path
    Path path_2 = Path();
    path_2.moveTo(size.width, 0);
    path_2.lineTo(size.width * 0.8137250, 0);
    path_2.lineTo(size.width * 0.8136389, size.height * 0.0001077813);
    path_2.cubicTo(
        size.width * 0.8025222,
        size.height * 0.01379518,
        size.width * 0.7923972,
        size.height * 0.02626268,
        size.width * 0.7837000,
        size.height * 0.03596789);
    path_2.cubicTo(
        size.width * 0.7639167,
        size.height * 0.05803813,
        size.width * 0.7399667,
        size.height * 0.07563378,
        size.width * 0.7171222,
        size.height * 0.09241572);
    path_2.cubicTo(
        size.width * 0.6505278,
        size.height * 0.1413401,
        size.width * 0.5933444,
        size.height * 0.1833495,
        size.width * 0.6762917,
        size.height * 0.3091495);
    path_2.cubicTo(
        size.width * 0.7058944,
        size.height * 0.3540468,
        size.width * 0.7333611,
        size.height * 0.3883913,
        size.width * 0.7581556,
        size.height * 0.4193913);
    path_2.lineTo(size.width * 0.7581556, size.height * 0.4193946);
    path_2.cubicTo(
        size.width * 0.8266583,
        size.height * 0.5050468,
        size.width * 0.8747333,
        size.height * 0.5651605,
        size.width * 0.8909722,
        size.height * 0.7517458);
    path_2.cubicTo(
        size.width * 0.9031889,
        size.height * 0.8921405,
        size.width * 0.9555667,
        size.height * 0.9635017,
        size.width,
        size.height * 0.9992575);
    path_2.lineTo(size.width, 0);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
        Offset(size.width * 79.6006 / 102, size.height * 212.793 / 299),
        Offset(size.width * 173.796 / 102, size.height * 35.6994 / 299), [
      const Color(0xff8989E5).withOpacity(0.40),
      const Color(0xff5933AB).withOpacity(0.40)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_2, paint2Fill);

    // First Path
    Path path_1 = Path();
    path_1.moveTo(size.width, 0);
    path_1.lineTo(size.width * 0.8224361, 0);
    path_1.cubicTo(
        size.width * 0.8275056,
        size.height * 0.05540167,
        size.width * 0.8372333,
        size.height * 0.09926488,
        size.width * 0.8458028,
        size.height * 0.1379097);
    path_1.lineTo(size.width * 0.8458056, size.height * 0.1379134);
    path_1.cubicTo(
        size.width * 0.8671889,
        size.height * 0.2343344,
        size.width * 0.8813722,
        size.height * 0.2982759,
        size.width * 0.7980194,
        size.height * 0.4279197);
    path_1.cubicTo(
        size.width * 0.6649972,
        size.height * 0.6348127,
        size.width * 0.7203639,
        size.height * 0.6932174,
        size.width * 0.8115111,
        size.height * 0.7893712);
    path_1.cubicTo(
        size.width * 0.8182806,
        size.height * 0.7965117,
        size.width * 0.8252472,
        size.height * 0.8038595,
        size.width * 0.8323472,
        size.height * 0.8114950);
    path_1.cubicTo(
        size.width * 0.8533361,
        size.height * 0.8340535,
        size.width * 0.8748417,
        size.height * 0.8670000,
        size.width * 0.8956611,
        size.height * 0.8988963);
    path_1.cubicTo(
        size.width * 0.9359139,
        size.height * 0.9605652,
        size.width * 0.9736000,
        size.height * 1.018298,
        size.width,
        size.height * 0.9894080);
    path_1.lineTo(size.width, 0);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 337.601 / 360, size.height * 212.793 / 299),
        Offset(size.width * 431.796 / 360, size.height * 35.6995 / 299), [
      const Color(0xff67BAF1).withOpacity(0.62),
      const Color(0xff303875).withOpacity(0.62)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}