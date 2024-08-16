import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;

@immutable
class AddHomePageQuestionAction extends redux.Action{
  final int questionId;
  const AddHomePageQuestionAction({required this.questionId});
}

@immutable
class GetNextPageHomeQuestionsIfNoPageAction extends redux.Action{
  const GetNextPageHomeQuestionsIfNoPageAction();
}
@immutable
class GetNextPageHomeQuestionsIfReadyAction extends redux.Action{
  const GetNextPageHomeQuestionsIfReadyAction();
}
@immutable
class GetNextPageHomeQuestionsAction extends redux.Action{
  const GetNextPageHomeQuestionsAction();
}
@immutable
class AddNextPageHomeQuestionsAction extends redux.Action{
  final Iterable<int> questionIds;
  const AddNextPageHomeQuestionsAction({required this.questionIds});
}
@immutable
class GetPrevPageHomePageQuestionsIfReadyAction extends redux.Action{
  const GetPrevPageHomePageQuestionsIfReadyAction();
}
@immutable
class GetPrevPageHomeQuestionsAction extends redux.Action{
  const GetPrevPageHomeQuestionsAction();
}
@immutable
class AddPrevPageHomeQuestionsAction extends redux.Action{
  final Iterable<int> questionIds;
  const AddPrevPageHomeQuestionsAction({required this.questionIds});
}
