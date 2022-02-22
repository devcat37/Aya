import 'package:aya/domain/models/survey/survey.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/aya_button/aya_button.dart';
import 'package:aya/presentation/pages/survey_question_page/survey_question_page_view.dart';
import 'package:flutter/material.dart';

class SurveyPageView extends StatelessWidget {
  const SurveyPageView({
    Key? key,
    required this.survey,
  }) : super(key: key);

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              children: survey.questions.map((e) => SurveyQuestionPageView(question: e)).toList(),
            ),
          ),
          Positioned(
            bottom: sidePadding48,
            child: AyaButton(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}