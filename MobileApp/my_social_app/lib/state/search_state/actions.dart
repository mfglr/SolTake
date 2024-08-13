import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class GetFirstPageSearchingUsersIfNoPageAction extends redux.Action{
  const GetFirstPageSearchingUsersIfNoPageAction();
}
@immutable
class GetFirstPageSearchingUsersAction extends redux.Action{
  const GetFirstPageSearchingUsersAction();
}
@immutable
class AddFirstPageSearchingUsersAction extends redux.Action{
  final Iterable<int> userIds;
  const AddFirstPageSearchingUsersAction({required this.userIds});
}
@immutable
class GetNextPageSearchingUsersIfReadyAction extends redux.Action{
  const GetNextPageSearchingUsersIfReadyAction();
}
@immutable
class GetNextPageSearchingUsersAction extends redux.Action{
  const GetNextPageSearchingUsersAction();
}
@immutable
class AddNextPageSearchingUsersAction extends redux.Action{
  final Iterable<int> userIds;
  const AddNextPageSearchingUsersAction({required this.userIds});
}

@immutable
class GetFirstPageSearhingQuestionsIfNoPageAction extends redux.Action{
  const GetFirstPageSearhingQuestionsIfNoPageAction();
}
@immutable
class GetFirstPageSearchingQuestionsAction extends redux.Action{
  const GetFirstPageSearchingQuestionsAction();
}
@immutable
class AddFirstPageSearchingQuestionsAction extends redux.Action{
  final Iterable<int> questionIds;
  const AddFirstPageSearchingQuestionsAction({required this.questionIds});
}
@immutable
class GetNextPageSearchingQuestionsIfReadyAction extends redux.Action{
  const GetNextPageSearchingQuestionsIfReadyAction();
}
@immutable
class GetNextPageSearchingQuestionsAction extends redux.Action{
  const GetNextPageSearchingQuestionsAction();
}
@immutable
class AddNextPageSearchingQuestionsAction extends redux.Action{
  final Iterable<int> questionIds;
  const AddNextPageSearchingQuestionsAction({required this.questionIds});
}

@immutable
class ChangeSearchKeyAction extends redux.Action{
  final String key;
  const ChangeSearchKeyAction({required this.key});
}
@immutable
class ChangeSearchExamIdAction extends redux.Action{
  final int examId;
  const ChangeSearchExamIdAction({required this.examId});
}
@immutable
class ChangeSearchSubjectIdAction extends redux.Action{
  final int subjectId;
  const ChangeSearchSubjectIdAction({required this.subjectId});
}
@immutable
class ChangeSearchTopicIdAction extends redux.Action{
  final int topicId;
  const ChangeSearchTopicIdAction({required this.topicId});
}

@immutable
class ClearSearchingAction extends redux.Action{
  const ClearSearchingAction();
}