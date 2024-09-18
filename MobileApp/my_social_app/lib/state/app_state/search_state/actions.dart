import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class GetFirstPageSearchingUsersIfNoPageAction extends AppAction{
  const GetFirstPageSearchingUsersIfNoPageAction();
}
@immutable
class GetFirstPageSearchingUsersAction extends AppAction{
  const GetFirstPageSearchingUsersAction();
}
@immutable
class AddFirstPageSearchingUsersAction extends AppAction{
  final Iterable<int> userIds;
  const AddFirstPageSearchingUsersAction({required this.userIds});
}
@immutable
class GetNextPageSearchingUsersIfReadyAction extends AppAction{
  const GetNextPageSearchingUsersIfReadyAction();
}
@immutable
class GetNextPageSearchingUsersAction extends AppAction{
  const GetNextPageSearchingUsersAction();
}
@immutable
class AddNextPageSearchingUsersAction extends AppAction{
  final Iterable<int> userIds;
  const AddNextPageSearchingUsersAction({required this.userIds});
}

@immutable
class GetNextPageSearchedUsersIfNoPageAction extends AppAction{
  const GetNextPageSearchedUsersIfNoPageAction();
}
@immutable
class GetNextPageSearchedUsersIfReadyAction extends AppAction{
  const GetNextPageSearchedUsersIfReadyAction();
}
@immutable
class GetNextPageSearchedUsersAction extends AppAction{
  const GetNextPageSearchedUsersAction();
}
@immutable
class AddNextPageSearchedUsersAction extends AppAction{
  final Iterable<int> searchIds;
  const AddNextPageSearchedUsersAction({required this.searchIds});
}
@immutable
class AddSearchedUserAction extends AppAction{
  final int userId;
  const AddSearchedUserAction({required this.userId});
}
@immutable
class AddSearchedUserSuccessAction extends AppAction{
  final int addedOne;
  final int removedOne;
  const AddSearchedUserSuccessAction({required this.addedOne,required this.removedOne});
}
@immutable
class RemoveSearchedUserAction extends AppAction{
  final int searchedId;
  const RemoveSearchedUserAction({required this.searchedId});
}
@immutable
class RemoveSearcedUserSuccessAction extends AppAction{
  final int searchId;
  const RemoveSearcedUserSuccessAction({required this.searchId});
}

@immutable
class GetFirstPageSearhingQuestionsIfNoPageAction extends AppAction{
  const GetFirstPageSearhingQuestionsIfNoPageAction();
}
@immutable
class GetFirstPageSearchingQuestionsAction extends AppAction{
  const GetFirstPageSearchingQuestionsAction();
}
@immutable
class AddFirstPageSearchingQuestionsAction extends AppAction{
  final Iterable<int> questionIds;
  const AddFirstPageSearchingQuestionsAction({required this.questionIds});
}
@immutable
class GetNextPageSearchingQuestionsIfReadyAction extends AppAction{
  const GetNextPageSearchingQuestionsIfReadyAction();
}
@immutable
class GetNextPageSearchingQuestionsAction extends AppAction{
  const GetNextPageSearchingQuestionsAction();
}
@immutable
class AddNextPageSearchingQuestionsAction extends AppAction{
  final Iterable<int> questionIds;
  const AddNextPageSearchingQuestionsAction({required this.questionIds});
}

@immutable
class ChangeSearchKeyAction extends AppAction{
  final String key;
  const ChangeSearchKeyAction({required this.key});
}
@immutable
class ChangeSearchExamIdAction extends AppAction{
  final int examId;
  const ChangeSearchExamIdAction({required this.examId});
}
@immutable
class ChangeSearchSubjectIdAction extends AppAction{
  final int subjectId;
  const ChangeSearchSubjectIdAction({required this.subjectId});
}
@immutable
class ChangeSearchTopicIdAction extends AppAction{
  final int topicId;
  const ChangeSearchTopicIdAction({required this.topicId});
}
@immutable
class ClearKeyAction extends AppAction{
  const ClearKeyAction();
}
