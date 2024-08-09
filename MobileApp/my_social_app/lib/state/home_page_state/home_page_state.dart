import 'package:my_social_app/state/pagination.dart';

class HomePageState{
  final Pagination questions;
  const HomePageState({required this.questions});

  HomePageState prependQuestion(int questionId) => HomePageState(questions: questions.prependOne(questionId));
  HomePageState getNextPageQuestions() => HomePageState(questions: questions.startLoading());
  HomePageState addNextPageQuestions(Iterable<int> questionIds) => HomePageState(questions: questions.addNextPage(questionIds));
}