import 'package:my_social_app/state/pagination/pagination.dart';

class HomePageState{
  final Pagination questions;
  const HomePageState({required this.questions});

  HomePageState getNextPageQuestions()
    => HomePageState(questions: questions.startLoadingNext());
  HomePageState addNextPageQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addNextPage(questionIds));
  HomePageState getPrevPageQuestions()
    => HomePageState(questions: questions.startLoadingPrev());
  HomePageState addPrevPageQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addPrevPage(questionIds));
  HomePageState prependQuestion(int questionId)
    => HomePageState(questions: questions.prependOne(questionId));

}