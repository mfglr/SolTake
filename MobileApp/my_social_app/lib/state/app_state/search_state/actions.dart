import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';



@immutable
class NextSearchedUsersAction extends AppAction{
  const NextSearchedUsersAction();
}
@immutable
class NextSearchedUsersSuccessAction extends AppAction{
  final Iterable<num> searchIds;
  const NextSearchedUsersSuccessAction({required this.searchIds});
}
@immutable
class NextSearchedUsersFailedAction extends AppAction{
  const NextSearchedUsersFailedAction();
}

@immutable
class AddSearchedUserAction extends AppAction{
  final num userId;
  const AddSearchedUserAction({required this.userId});
}
@immutable
class AddSearchedUserSuccessAction extends AppAction{
  final num addedOne;
  final num removedOne;
  const AddSearchedUserSuccessAction({required this.addedOne,required this.removedOne});
}
@immutable
class RemoveSearchedUserAction extends AppAction{
  final num searchedId;
  const RemoveSearchedUserAction({required this.searchedId});
}
@immutable
class RemoveSearcedUserSuccessAction extends AppAction{
  final num searchId;
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
  final num examId;
  const ChangeSearchExamIdAction({required this.examId});
}
@immutable
class ChangeSearchSubjectIdAction extends AppAction{
  final num subjectId;
  const ChangeSearchSubjectIdAction({required this.subjectId});
}
@immutable
class ChangeSearchTopicIdAction extends AppAction{
  final num topicId;
  const ChangeSearchTopicIdAction({required this.topicId});
}
@immutable
class ClearKeyAction extends AppAction{
  const ClearKeyAction();
}
