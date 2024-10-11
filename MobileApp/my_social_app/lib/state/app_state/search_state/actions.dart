import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class FirstSearchingUsersAction extends AppAction{
  const FirstSearchingUsersAction();
}
@immutable
class FirstSearchingUsersSuccessAction extends AppAction{
  final Iterable<int> userIds;
  const FirstSearchingUsersSuccessAction({required this.userIds});
}
@immutable
class FirstSearchingUsersFailedAction extends AppAction{
  const FirstSearchingUsersFailedAction();
}

@immutable
class NextSearchingUsersAction extends AppAction{
  const NextSearchingUsersAction();
}
@immutable
class NextSearchingUsersSuccessAction extends AppAction{
  final Iterable<int> userIds;
  const NextSearchingUsersSuccessAction({required this.userIds});
}
@immutable
class NextSearhcingUsersFailedAction extends AppAction{
  const NextSearhcingUsersFailedAction();
}

@immutable
class NextSearchedUsersAction extends AppAction{
  const NextSearchedUsersAction();
}
@immutable
class NextSearchedUsersSuccessAction extends AppAction{
  final Iterable<int> searchIds;
  const NextSearchedUsersSuccessAction({required this.searchIds});
}
@immutable
class NextSearchedUsersFailedAction extends AppAction{
  const NextSearchedUsersFailedAction();
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
class FirstSearchingQuestionsAction extends AppAction{
  const FirstSearchingQuestionsAction();
}
@immutable
class FirstSearchingQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const FirstSearchingQuestionsSuccessAction({required this.questionIds});
}
@immutable
class FirstSearchingQuestionsFailedAction extends AppAction{
  const FirstSearchingQuestionsFailedAction();
}

@immutable
class NextSearchingQuestionsAction extends AppAction{
  const NextSearchingQuestionsAction();
}
@immutable
class NextSearchingQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const NextSearchingQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextSearchingQuestionsFailedAction extends AppAction{
  const NextSearchingQuestionsFailedAction();
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
