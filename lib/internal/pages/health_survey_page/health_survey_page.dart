import 'package:aya/domain/models/question/question.dart';
import 'package:aya/domain/models/question/question_option.dart';
import 'package:aya/domain/models/question/scrolling_double_value_question.dart';
import 'package:aya/domain/models/question/single_option_question.dart';
import 'package:aya/domain/models/survey/survey.dart';
import 'package:aya/internal/pages/survey_page/survey_page.dart';
import 'package:flutter/material.dart';

class HealthSurveyPage extends StatelessWidget {
  const HealthSurveyPage({Key? key}) : super(key: key);

  static const routeName = '/health-survey-page';

  @override
  Widget build(BuildContext context) {
    return SurveyPage(
      survey: Survey(
        questions: [
          SingleOptionQuestion(
            title: 'Как вы чувствуете себя сегодня?',
            options: [
              QuestionOption(text: 'Отлично'),
              QuestionOption(text: 'Хорошо'),
              QuestionOption(text: 'Фигово'),
            ],
          ),
          ScrollingDoubleValueQuestion(
            title: 'Какая у вас температура?',
            separatorSymbol: '.',
          ),
          ScrollingDoubleValueQuestion(
            title: 'Какое у вас давление?',
            separatorSymbol: '/',
          ),
        ],
      ),
    );
  }
}
