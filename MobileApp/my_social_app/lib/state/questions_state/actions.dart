import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';

//questions

//load question
@immutable
class LoadQuestionAction extends AppAction{
  final int questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class LoadQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const LoadQuestionSuccessAction({required this.question});
}
@immutable
class LoadQuestionFailedAction extends AppAction{
  final int questionId;
  const LoadQuestionFailedAction({required this.questionId});
}
@immutable
class QuestionNotFoundAction extends AppAction{
  final int questionId;
  const QuestionNotFoundAction({required this.questionId});
}
//load question


//upload question
@immutable
class UploadQuestionAction extends AppAction{
  final QuestionState question;
  const UploadQuestionAction({
    required this.question
  });
}
@immutable
class ChangeQuestionRateAction extends AppAction{
  final int questionId;
  final double rate;
  const ChangeQuestionRateAction({
    required this.questionId,
    required this.rate
  });
}
@immutable
class MarkQuestionStatusAsProcessing extends AppAction{
  final int questionId;
  const MarkQuestionStatusAsProcessing({required this.questionId});
}
@immutable
class UploadQuestionSuccessAction extends AppAction{
  final QuestionState question;
  final int serverId;
  final Iterable<Media> medias;
  const UploadQuestionSuccessAction({
    required this.question,
    required this.serverId,
    required this.medias
  });
}
@immutable
class UploadQuestionFailedAction extends AppAction{
  final int questionId;
  const UploadQuestionFailedAction({required this.questionId});
}


@immutable
class DeleteQuestionAction extends AppAction{
  final QuestionState question;
  const DeleteQuestionAction({required this.question});
}
@immutable
class DeleteQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const DeleteQuestionSuccessAction({required this.question});
}
//questions

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

//search page questions
@immutable
class NextSearchPageQuestionsAction extends AppAction{
  const NextSearchPageQuestionsAction();
}
@immutable
class NextSearchPageQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const NextSearchPageQuestionsSuccessAction({required this.questions});
}
@immutable
class NextSearchPageQuestionsFailedAction extends AppAction{
  const NextSearchPageQuestionsFailedAction();
}

@immutable
class RefreshSearchPageQuestionsAction extends AppAction{
  const RefreshSearchPageQuestionsAction();
}
@immutable
class RefreshSearchPageQuestionsSuccessAction extends AppAction{
  final Iterable<QuestionState> questions;
  const RefreshSearchPageQuestionsSuccessAction({required this.questions});
}
@immutable
class RefreshSearchPageQuestionsFailedAction extends AppAction{
  const RefreshSearchPageQuestionsFailedAction();
}
//search page questions

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

//subject questions
@immutable
class NextSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const NextSubjectQuestionsAction({required this.subjectId});
}
@immutable
class NextSubjectQuestionsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<QuestionState> questions;
  const NextSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}
@immutable
class NextSubjectQuestionsFailedAction extends AppAction{
  final int subjectId;
  const NextSubjectQuestionsFailedAction({required this.subjectId});
}

@immutable
class RefreshSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const RefreshSubjectQuestionsAction({required this.subjectId});
}
@immutable
class RefreshSubjectQuestionsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<QuestionState> questions;
  const RefreshSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}
@immutable
class RefreshSubjectQuestionsFailedAction extends AppAction{
  final int subjectId;
  const RefreshSubjectQuestionsFailedAction({required this.subjectId});
}
//subject questions

//topic questions
@immutable
class NextTopicQuestionsAction extends AppAction{
  final int topicId;
  const NextTopicQuestionsAction({required this.topicId});
}
@immutable
class NextTopicQuestionsSuccessAction extends AppAction{
  final int topicId;
  final Iterable<QuestionState> questions;
  const NextTopicQuestionsSuccessAction({required this.topicId, required this.questions});
}
@immutable
class NextTopicQuestionsFailedAction extends AppAction{
  final int topicId;
  const NextTopicQuestionsFailedAction({required this.topicId});
}

@immutable
class RefreshTopicQuestionsAction extends AppAction{
  final int topicId;
  const RefreshTopicQuestionsAction({required this.topicId});
}
@immutable
class RefreshTopicQuestionsSuccessAction extends AppAction{
  final int topicId;
  final Iterable<QuestionState> questions;
  const RefreshTopicQuestionsSuccessAction({required this.topicId, required this.questions});
}
@immutable
class RefreshTopicQuestionsFailedAction extends AppAction{
  final int topicId;
  const RefreshTopicQuestionsFailedAction({required this.topicId});
}
//topic questions



