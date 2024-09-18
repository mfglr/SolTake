import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class AddHomePageQuestionAction extends AppAction{
  final int questionId;
  const AddHomePageQuestionAction({required this.questionId});
}

@immutable
class GetNextPageHomeQuestionsIfNoPageAction extends AppAction{
  const GetNextPageHomeQuestionsIfNoPageAction();
}
@immutable
class GetNextPageHomeQuestionsIfReadyAction extends AppAction{
  const GetNextPageHomeQuestionsIfReadyAction();
}
@immutable
class GetNextPageHomeQuestionsAction extends AppAction{
  const GetNextPageHomeQuestionsAction();
}
@immutable
class AddNextPageHomeQuestionsAction extends AppAction{
  final Iterable<int> questionIds;
  const AddNextPageHomeQuestionsAction({required this.questionIds});
}
@immutable
class GetPrevPageHomePageQuestionsIfReadyAction extends AppAction{
  const GetPrevPageHomePageQuestionsIfReadyAction();
}
@immutable
class GetPrevPageHomeQuestionsAction extends AppAction{
  const GetPrevPageHomeQuestionsAction();
}
@immutable
class AddPrevPageHomeQuestionsAction extends AppAction{
  final Iterable<int> questionIds;
  const AddPrevPageHomeQuestionsAction({required this.questionIds});
}
