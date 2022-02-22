import 'package:aya/internal/utils/infrastructure.dart';
import 'package:flutter/material.dart';

class SurveyQuestionHeader extends StatelessWidget {
  const SurveyQuestionHeader({Key? key, required this.title}) : super(key: key);

  static const defaultHeight = 200.0;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: defaultHeight,
      decoration: const BoxDecoration(
        color: mainGreenColor,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: sidePadding, bottom: sidePadding, right: sidePadding48 * 2),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: whiteColor),
          ),
        ),
      ),
    );
  }
}
