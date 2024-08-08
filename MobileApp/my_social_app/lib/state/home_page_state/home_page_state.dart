import 'package:my_social_app/state/pagination.dart';

class HomePageState{
  final Pagination questions;
  const HomePageState({required this.questions});

  HomePageState getNextPageQuestions()
    => HomePageState(
        questions: questions.getNextPage()
      );

  HomePageState addNextPageQuestions(Iterable<int> questionIds)
    => HomePageState(
      questions: questions.addNextPage(questionIds)
    );
}