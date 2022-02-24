import 'package:aya/domain/models/question/question.dart';
import 'package:aya/domain/models/question/scrolling_double_value_question.dart';
import 'package:aya/domain/models/question/single_option_question.dart';
import 'package:aya/presentation/pages/survey_question_page/survey_options/scrolling_value_question_widget.dart';
import 'package:aya/presentation/pages/survey_question_page/survey_options/single_option_question_widget.dart';
import 'package:flutter/material.dart';

class SurveyQuestionOption extends Widget {
  const SurveyQuestionOption({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Element createElement() {
    switch (question.runtimeType) {
      case ScrollingDoubleValueQuestion:
        return StatefulElement(
          ScrollingValueQuestionWidget(question: question as ScrollingDoubleValueQuestion),
        );
      case SingleOptionQuestion:
      default:
        return StatefulElement(
          SingleOptionQuestionWidget(question: question as SingleOptionQuestion),
        );
    }
  }
}
