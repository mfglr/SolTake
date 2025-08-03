import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';

@immutable
class CreateQuestionAction extends AppAction{
  final String id;
  final int examId;
  final int subjectId;
  final int? topicId;
  final String content;
  final Iterable<AppFile> medias;

  const CreateQuestionAction({
    required this.id,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.content,
    required this.medias
  });
}
@immutable
class CreateQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const CreateQuestionSuccessAction({required this.question});
}

//home questions
@immutable
class NextHomeQuestionsAction extends AppAction{
  const NextHomeQuestionsAction();
}
@immutable
class NextHomeQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const NextHomeQuestionsSuccessAction({required this.questions});
}
@immutable
class NextHomeQuestionsFailedAction extends AppAction{
  const NextHomeQuestionsFailedAction();
}
@immutable
class RefreshHomeQuestionsAction extends AppAction{
  const RefreshHomeQuestionsAction();
}
@immutable
class RefreshHomeQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const RefreshHomeQuestionsSuccessAction({required this.questions});
}
@immutable
class RefreshHomeQuestionsFailedAction extends AppAction{
  const RefreshHomeQuestionsFailedAction();
}
//home questions

//video questions
@immutable
class NextVideoQuestionsAction extends AppAction{
  const NextVideoQuestionsAction();
}
@immutable
class NextVideoQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const NextVideoQuestionsSuccessAction({required this.questions});
}
@immutable
class NextVideoQuestionsFailedAction extends AppAction{
  const NextVideoQuestionsFailedAction();
}
@immutable
class RefreshVideoQuestionsAction extends AppAction{
  const RefreshVideoQuestionsAction();
}
@immutable
class RefreshVideoQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const RefreshVideoQuestionsSuccessAction({required this.questions});
}
@immutable
class RefreshVideoQuestionsFailedAction extends AppAction{
  const RefreshVideoQuestionsFailedAction();
}
//video questions

//user questions
@immutable
class NextUserQuestionsAction extends AppAction{
  final int userId;
  const NextUserQuestionsAction({required this.userId});
}
@immutable
class NextUserQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserQuestionsSuccessAction({
    required this.userId,
    required this.questions
  });
}
@immutable
class NextUserQuestionsFailedAction extends AppAction{
  final int userId;
  const NextUserQuestionsFailedAction({required this.userId});
}
@immutable
class RefreshUserQuestionsAction extends AppAction{
  final int userId;
  const RefreshUserQuestionsAction({required this.userId});
}
@immutable
class RefreshUserQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserQuestionsFailedAction extends AppAction{
  final int userId;
  const RefreshUserQuestionsFailedAction({required this.userId});
}
//user questions
