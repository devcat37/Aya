import 'package:aya/domain/models/question/question.dart';
import 'package:aya/domain/models/question/question_option.dart';

class SingleOptionQuestion extends Question {
  SingleOptionQuestion({
    required String title,
    this.options = const [],
  }) : super(title: title);

  final List<QuestionOption> options;

  int _chosenOption = -1;
  int get chosenOption => _chosenOption;

  @override
  bool get hasAnswer => _chosenOption != -1;

  void chooseOption(QuestionOption option) {
    _chosenOption = options.indexOf(option);
  }
}
