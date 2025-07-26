import 'package:app_file/app_file.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';

@immutable
class QuestionsAction extends AppAction{
  const QuestionsAction();
}

@immutable
class CreateQuestionAction extends QuestionsAction{
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
class CreateQuestionSuccessAction extends QuestionsAction{
  final QuestionState question;
  const CreateQuestionSuccessAction({required this.question});
}

@immutable
class DeleteQuestionAction extends QuestionsAction{
  final QuestionState question;
  const DeleteQuestionAction({required this.question});
}
@immutable
class DeleteQuestionSuccessAction extends QuestionsAction{
  final QuestionState question;
  const DeleteQuestionSuccessAction({required this.question});
}


//question user likes
@immutable
class NextQuestionUserLikesAction extends QuestionsAction{
  final int questionId;
  const NextQuestionUserLikesAction({required this.questionId});
}
@immutable
class NextQuestionUserLikesSuccessAction extends QuestionsAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const NextQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class NextQuestionUserLikesFailedAction extends QuestionsAction{
  final int questionId;
  const NextQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class RefreshQuestionUserLikesAction extends QuestionsAction{
  final int questionId;
  const RefreshQuestionUserLikesAction({required this.questionId});
}
@immutable
class RefreshQuestionUserLikesSuccessAction extends QuestionsAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const RefreshQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class RefreshQuestionUserLikesFailedAction extends QuestionsAction{
  final int questionId;
  const RefreshQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class LikeQuestionAction extends QuestionsAction{
  final QuestionState question;
  const LikeQuestionAction({required this.question});
}
@immutable
class LikeQuestionSuccessAction extends QuestionsAction{
  final QuestionState question;
  final QuestionUserLikeState questionUserLike;
  const LikeQuestionSuccessAction({required this.question, required this.questionUserLike});
}

@immutable
class DislikeQuestionAction extends QuestionsAction{
  final QuestionState question;
  const DislikeQuestionAction({required this.question});
}
@immutable
class DislikeQuestionSuccessAction extends QuestionsAction{
  final QuestionState question;
  final int userId;
  const DislikeQuestionSuccessAction({required this.question, required this.userId});
}
//question user likes

//question user saves
@immutable
class NextQuestionUserSavesAction extends QuestionsAction{
  const NextQuestionUserSavesAction();
}
@immutable
class NextQuestionUserSavesSuccessAction extends QuestionsAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const NextQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class NextQuestionUserSavesFailedAction extends QuestionsAction{
  const NextQuestionUserSavesFailedAction();
}

@immutable
class RefreshQuestionUserSavesAction extends QuestionsAction{
  const RefreshQuestionUserSavesAction();
}
@immutable
class RefreshQuestionUserSavesSuccessAction extends QuestionsAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const RefreshQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class RefreshQuestionUserSavesFailedAction extends QuestionsAction{
  const RefreshQuestionUserSavesFailedAction();
}

@immutable
class SaveQuestionAction extends QuestionsAction{
  final QuestionState question;
  const SaveQuestionAction({required this.question});
}
@immutable
class SaveQuestionSuccessAction extends QuestionsAction{
  final QuestionUserSaveState questionUserSave;
  const SaveQuestionSuccessAction({required this.questionUserSave});
}

@immutable
class UnsaveQuestionAction extends QuestionsAction{
  final QuestionState question;
  const UnsaveQuestionAction({required this.question});
}
@immutable
class UnsaveQuestionSuccessAction extends QuestionsAction{
  final QuestionState question;
  const UnsaveQuestionSuccessAction({required this.question});
} 
//question user saves


// home page questions
@immutable
class NextHomePageQuestionsAction extends QuestionsAction{
  const NextHomePageQuestionsAction();
}
@immutable
class NextHomePageQuestionsSuccessAction extends QuestionsAction{
  final Iterable<QuestionState> questions;
  const NextHomePageQuestionsSuccessAction({required this.questions});
}
@immutable
class NextHomePageQuestionsFailedAction extends QuestionsAction{
  const NextHomePageQuestionsFailedAction();
}

@immutable
class RefreshHomePageQuestionsAction extends QuestionsAction{
  const RefreshHomePageQuestionsAction();
}
@immutable
class RefreshHomePageQuestionsSuccessAction extends QuestionsAction{
  final Iterable<QuestionState> questions;
  const RefreshHomePageQuestionsSuccessAction({required this.questions});
}
@immutable
class RefreshHomePageQuestionsFailedAction extends QuestionsAction{
  const RefreshHomePageQuestionsFailedAction();
}
// home page questions

//user questions
@immutable
class NextUserQuestionsAction extends QuestionsAction{
  final int userId;
  const NextUserQuestionsAction({required this.userId});
}
@immutable
class NextUserQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class NextUserQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const NextUserQuestionsFailedAction({required this.userId});
}

@immutable
class RefreshUserQuestionsAction extends QuestionsAction{
  final int userId;
  const RefreshUserQuestionsAction({required this.userId});
}
@immutable
class RefreshUserQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const RefreshUserQuestionsFailedAction({required this.userId});
}
//user questions

//user solved questions
@immutable
class NextUserSolvedQuestionsAction extends QuestionsAction{
  final int userId;
  const NextUserSolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserSolvedQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserSolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class NextUserSolvedQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const NextUserSolvedQuestionsFailedAction({required this.userId});
}

@immutable
class RefreshUserSolvedQuestionsAction extends QuestionsAction{
  final int userId;
  const RefreshUserSolvedQuestionsAction({required this.userId});
}
@immutable
class RefreshUserSolvedQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserSolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserSolvedQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const RefreshUserSolvedQuestionsFailedAction({required this.userId});
}
//user solved questions

//user unsolved questions
@immutable
class NextUserUnsolvedQuestionsAction extends QuestionsAction{
  final int userId;
  const NextUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class NextUserUnsolvedQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const NextUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class NextUserUnsolvedQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const NextUserUnsolvedQuestionsFailedAction({required this.userId});
}

@immutable
class RefreshUserUnsolvedQuestionsAction extends QuestionsAction{
  final int userId;
  const RefreshUserUnsolvedQuestionsAction({required this.userId});
}
@immutable
class RefreshUserUnsolvedQuestionsSuccessAction extends QuestionsAction{
  final int userId;
  final Iterable<QuestionState> questions;
  const RefreshUserUnsolvedQuestionsSuccessAction({required this.userId, required this.questions});
}
@immutable
class RefreshUserUnsolvedQuestionsFailedAction extends QuestionsAction{
  final int userId;
  const RefreshUserUnsolvedQuestionsFailedAction({required this.userId});
}
//user unsolved questions

//exams questions
@immutable
class NextExamQuestionsAction extends QuestionsAction{
  final int examId;
  const NextExamQuestionsAction({required this.examId});
}
@immutable
class NextExamQuestionsSuccessAction extends QuestionsAction{
  final int examId;
  final Iterable<QuestionState> questions;
  const NextExamQuestionsSuccessAction({required this.examId, required this.questions});
}
@immutable
class NextExamQuestionsFailedAction extends QuestionsAction{
  final int examId;
  const NextExamQuestionsFailedAction({required this.examId});
}

@immutable
class RefreshExamQuestionsAction extends QuestionsAction{
  final int examId;
  const RefreshExamQuestionsAction({required this.examId});
}
@immutable
class RefreshExamQuestionsSuccessAction extends QuestionsAction{
  final int examId;
  final Iterable<QuestionState> questions;
  const RefreshExamQuestionsSuccessAction({required this.examId, required this.questions});
}
@immutable
class RefreshExamQuestionsFailedAction extends QuestionsAction{
  final int examId;
  const RefreshExamQuestionsFailedAction({required this.examId});
}
//exams questions

//subject questions
@immutable
class NextSubjectQuestionsAction extends QuestionsAction{
  final int subjectId;
  const NextSubjectQuestionsAction({required this.subjectId});
}
@immutable
class NextSubjectQuestionsSuccessAction extends QuestionsAction{
  final int subjectId;
  final Iterable<QuestionState> questions;
  const NextSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}
@immutable
class NextSubjectQuestionsFailedAction extends QuestionsAction{
  final int subjectId;
  const NextSubjectQuestionsFailedAction({required this.subjectId});
}

@immutable
class RefreshSubjectQuestionsAction extends QuestionsAction{
  final int subjectId;
  const RefreshSubjectQuestionsAction({required this.subjectId});
}
@immutable
class RefreshSubjectQuestionsSuccessAction extends QuestionsAction{
  final int subjectId;
  final Iterable<QuestionState> questions;
  const RefreshSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}
@immutable
class RefreshSubjectQuestionsFailedAction extends QuestionsAction{
  final int subjectId;
  const RefreshSubjectQuestionsFailedAction({required this.subjectId});
}
//subject questions

//topic questions
@immutable
class NextTopicQuestionsAction extends QuestionsAction{
  final int topicId;
  const NextTopicQuestionsAction({required this.topicId});
}
@immutable
class NextTopicQuestionsSuccessAction extends QuestionsAction{
  final int topicId;
  final Iterable<QuestionState> questions;
  const NextTopicQuestionsSuccessAction({required this.topicId, required this.questions});
}
@immutable
class NextTopicQuestionsFailedAction extends QuestionsAction{
  final int topicId;
  const NextTopicQuestionsFailedAction({required this.topicId});
}

@immutable
class RefreshTopicQuestionsAction extends QuestionsAction{
  final int topicId;
  const RefreshTopicQuestionsAction({required this.topicId});
}
@immutable
class RefreshTopicQuestionsSuccessAction extends QuestionsAction{
  final int topicId;
  final Iterable<QuestionState> questions;
  const RefreshTopicQuestionsSuccessAction({required this.topicId, required this.questions});
}
@immutable
class RefreshTopicQuestionsFailedAction extends QuestionsAction{
  final int topicId;
  const RefreshTopicQuestionsFailedAction({required this.topicId});
}
//subject questions
