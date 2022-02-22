import 'package:aya/internal/utils/infrastructure.dart';
import 'package:flutter/material.dart';

class AyaButton extends StatelessWidget {
  const AyaButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  static const defaultHeight = 50.0;
  static const defaultWidth = 250.0;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius8,
        child: Ink(
          height: defaultHeight,
          width: defaultWidth,
          decoration: BoxDecoration(
            borderRadius: borderRadius8,
            color: mainGreenColor,
          ),
        ),
      ),
    );
  }
}
