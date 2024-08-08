import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

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

