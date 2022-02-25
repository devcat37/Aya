// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:aya/internal/pages/health_survey_page/health_survey_page.dart';
import 'package:aya/internal/pages/workspace/workspace.dart';

bool canPop(BuildContext context) => Navigator.of(context).canPop();

void pop(BuildContext context, [dynamic result]) => Navigator.of(context).pop(result);

Future<void> goToHealthSurveyPage(BuildContext context) async =>
    await Navigator.of(context).pushNamed(HealthSurveyPage.routeName);

void goToMainPage(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(Workspace.routeName, (route) => false);
