// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/domain/models/survey/survey.dart';
import 'package:aya/presentation/pages/survey_page/survey_page_view.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({
    Key? key,
    required this.survey,
  }) : super(key: key);

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return SurveyPageView(survey: survey);
  }
}
