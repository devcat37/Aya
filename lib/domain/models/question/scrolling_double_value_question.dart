import 'package:aya/domain/models/question/question.dart';

class ScrollingDoubleValueQuestion extends Question {
  ScrollingDoubleValueQuestion({
    required String title,
    required this.separatorSymbol,
  }) : super(title: title);

  final String separatorSymbol;

  @override
  bool get hasAnswer => true;
}
