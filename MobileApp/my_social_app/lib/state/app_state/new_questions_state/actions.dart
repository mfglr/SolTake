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

//user solved questions
@immutable
class NextUserSolvedQuestionsAction extends AppAction{
  final int userId;
  const NextUserSolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserSolvedQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserSolvedQuestionsSuccessAction({
    required this.userId,
    required this.questions
  });
}
@immutable
class NextUserSolvedQuestionsFailedAction extends AppAction{
  final int userId;
  const NextUserSolvedQuestionsFailedAction({required this.userId});
}
@immutable
class RefreshUserSolvedQuestionsAction extends AppAction{
  final int userId;
  const RefreshUserSolvedQuestionsAction({required this.userId});
}
@immutable
class RefreshUserSolvedQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserSolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserSolvedQuestionsFailedAction extends AppAction{
  final int userId;
  const RefreshUserSolvedQuestionsFailedAction({required this.userId});
}
//user solved questions

//user unsolved questions
@immutable
class NextUserUnsolvedQuestionsAction extends AppAction{
  final int userId;
  const NextUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserUnsolvedQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class NextUserUnsolvedQuestionsFailedAction extends AppAction{
  final int userId;
  const NextUserUnsolvedQuestionsFailedAction({required this.userId});
}

@immutable
class RefreshUserUnsolvedQuestionsAction extends AppAction{
  final int userId;
  const RefreshUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class RefreshUserUnsolvedQuestionsSuccessAction extends AppAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserUnsolvedQuestionsFailedAction extends AppAction{
  final int userId;
  const RefreshUserUnsolvedQuestionsFailedAction({required this.userId});
}
//user unsolved questions

//exams questions
@immutable
class NextExamQuestionsAction extends AppAction{
  final int examId;
  const NextExamQuestionsAction({required this.examId});
}
@immutable
class NextExamQuestionsSuccessAction extends AppAction{
  final int examId;
  final Iterable<QuestionState> questions;
  const NextExamQuestionsSuccessAction({required this.examId, required this.questions});
}
@immutable
class NextExamQuestionsFailedAction extends AppAction{
  final int examId;
  const NextExamQuestionsFailedAction({required this.examId});
}

@immutable
class RefreshExamQuestionsAction extends AppAction{
  final int examId;
  const RefreshExamQuestionsAction({required this.examId});
}
@immutable
class RefreshExamQuestionsSuccessAction extends AppAction{
  final int examId;
  final Iterable<QuestionState> questions;
  const RefreshExamQuestionsSuccessAction({required this.examId, required this.questions});
}
@immutable
class RefreshExamQuestionsFailedAction extends AppAction{
  final int examId;
  const RefreshExamQuestionsFailedAction({required this.examId});
}
//exams questions



