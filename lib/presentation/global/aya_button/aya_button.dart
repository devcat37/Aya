// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/utils/infrastructure.dart';

class AyaButton extends StatelessWidget {
  const AyaButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  static const defaultHeight = 50.0;
  static const defaultWidth = 250.0;

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius16,
        child: Ink(
          height: defaultHeight,
          width: defaultWidth,
          decoration: BoxDecoration(
            borderRadius: borderRadius16,
            color: mainGreenColor,
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.button!.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
