import 'package:my_social_app/state/ids.dart';

class HomePageState{
  final Ids questions;
  const HomePageState({required this.questions});

  HomePageState nextPageOfQuestions(Iterable<int> questionIds)
    => HomePageState(
        questions: questions.nextPage(questionIds)
      );
}