import 'package:aya/domain/models/question/question.dart';

class SingleOptionQuestion extends Question {
  const SingleOptionQuestion({
    required String title,
  }) : super(title: title);
}
