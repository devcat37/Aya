import 'package:aya/domain/models/question/question.dart';

class Survey {
  Survey({
    required this.questions,
  });

  final List<Question> questions;

  int _currentQuestion = 0;
  int get currentQuestion => _currentQuestion;

  bool get currentQuestionHasAnswer => questions.elementAt(_currentQuestion).hasAnswer;
  bool get isLastQuestion => _currentQuestion == questions.length - 1;

  void handleAnswer() {
    if (_currentQuestion == questions.length - 1) {
      finishSurvey();
    } else {
      goToNextQuestion();
    }
  }

  void finishSurvey() {}

  void goToNextQuestion() {
    _currentQuestion++;
  }
}
