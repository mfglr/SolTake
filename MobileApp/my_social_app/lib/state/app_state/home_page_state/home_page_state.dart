import 'package:my_social_app/state/pagination/pagination.dart';

class HomePageState{
  final Pagination questions;
  const HomePageState({required this.questions});

  HomePageState startLoadingNextQuestions()
    => HomePageState(questions: questions.startLoadingNext());
  HomePageState stopLoadingNextQuestions()
    => HomePageState(questions: questions.stopLoadingNext());
  HomePageState addNextQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addNextPage(questionIds));

  HomePageState startLoadingPrevPageQuestions()
    => HomePageState(questions: questions.startLoadingPrev());
  HomePageState addPrevPageQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addPrevPage(questionIds));
  HomePageState stopLoadingPrevPageQuestions()
    => HomePageState(questions: questions.stopLoadingPrev());
}