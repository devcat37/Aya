// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/utils/infrastructure.dart';

/// Расчитывает размер текста.
Size getTextWidgetSize(String text, TextStyle style,
    {double minWidth = 0, double maxWidth = double.infinity, int maxLines = 1}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.size;
}

Color blendTwoColors(Color one, Color two, [double percent = 0.5]) {
  return Color.fromRGBO(
    (one.red * percent + two.red * (1 - percent)).toInt(),
    (one.green * percent + two.green * (1 - percent)).toInt(),
    (one.blue * percent + two.blue * (1 - percent)).toInt(),
    1.0,
  );
}

List<Color> usernameToGradient(String username) {
  final int length = username.length;
  final int index = length % imageColors.length;

  return imageColors.elementAt(index);
}
