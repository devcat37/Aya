import 'package:aya/domain/models/question/question.dart';

class Survey {
  const Survey({
    required this.questions,
  });

  final List<Question> questions;
}
