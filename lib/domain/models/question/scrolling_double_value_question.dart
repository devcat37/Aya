// Project imports:
import 'package:aya/domain/models/question/question.dart';

class ScrollingDoubleValueQuestion extends Question {
  ScrollingDoubleValueQuestion({
    required String title,
    required this.separatorSymbol,
    required this.valuesOne,
    required this.valuesTwo,
  }) : super(title: title);

  final String separatorSymbol;
  final List<String> valuesOne;
  final List<String> valuesTwo;

  @override
  bool get hasAnswer => true;
}
