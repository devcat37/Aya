import 'package:aya/domain/models/question/question.dart';
import 'package:aya/presentation/pages/survey_question_page/survey_question__header.dart';
import 'package:flutter/material.dart';

class SurveyQuestionPageView extends StatelessWidget {
  const SurveyQuestionPageView({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        // Заголовок тестирования с текстом вопроса.
        SurveyQuestionHeader(title: question.title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }
}
