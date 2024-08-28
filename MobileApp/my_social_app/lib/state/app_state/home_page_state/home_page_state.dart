import 'package:my_social_app/state/pagination/id_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

class HomePageState{
  final Pagination<num,IdState> questions;
  const HomePageState({required this.questions});

  HomePageState getNextPageQuestions()
    => HomePageState(questions: questions.startLoadingNext());
  HomePageState addNextPageQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addNextPage(questionIds.map((e) => IdState(key: e))));
  HomePageState getPrevPageQuestions()
    => HomePageState(questions: questions.startLoadingPrev());
  HomePageState addPrevPageQuestions(Iterable<int> questionIds)
    => HomePageState(questions: questions.addPrevPage(questionIds.map((e) => IdState(key: e))));
  HomePageState prependQuestion(int questionId)
    => HomePageState(questions: questions.prependOne(IdState(key: questionId)));

}