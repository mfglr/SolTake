import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';

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
class LoadQuestionNotFoundAction extends AppAction{
  final int questionId;
  const LoadQuestionNotFoundAction({required this.questionId});
}


//questions
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

//question user likes
@immutable
class NextQuestionUserLikesAction extends AppAction{
  final int questionId;
  const NextQuestionUserLikesAction({required this.questionId});
}
@immutable
class NextQuestionUserLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const NextQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class NextQuestionUserLikesFailedAction extends AppAction{
  final int questionId;
  const NextQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class RefreshQuestionUserLikesAction extends AppAction{
  final int questionId;
  const RefreshQuestionUserLikesAction({required this.questionId});
}
@immutable
class RefreshQuestionUserLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<QuestionUserLikeState> questionUserLikes;
  const RefreshQuestionUserLikesSuccessAction({required this.questionId, required this.questionUserLikes});
}
@immutable
class RefreshQuestionUserLikesFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionUserLikesFailedAction({required this.questionId});
}

@immutable
class LikeQuestionAction extends AppAction{
  final QuestionState question;
  const LikeQuestionAction({required this.question});
}
@immutable
class LikeQuestionSuccessAction extends AppAction{
  final QuestionState question;
  final QuestionUserLikeState questionUserLike;
  const LikeQuestionSuccessAction({required this.question, required this.questionUserLike});
}

@immutable
class DislikeQuestionAction extends AppAction{
  final QuestionState question;
  const DislikeQuestionAction({required this.question});
}
@immutable
class DislikeQuestionSuccessAction extends AppAction{
  final QuestionState question;
  final int userId;
  const DislikeQuestionSuccessAction({required this.question, required this.userId});
}
//question user likes

//question user saves
@immutable
class NextQuestionUserSavesAction extends AppAction{
  const NextQuestionUserSavesAction();
}
@immutable
class NextQuestionUserSavesSuccessAction extends AppAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const NextQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class NextQuestionUserSavesFailedAction extends AppAction{
  const NextQuestionUserSavesFailedAction();
}

@immutable
class RefreshQuestionUserSavesAction extends AppAction{
  const RefreshQuestionUserSavesAction();
}
@immutable
class RefreshQuestionUserSavesSuccessAction extends AppAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const RefreshQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class RefreshQuestionUserSavesFailedAction extends AppAction{
  const RefreshQuestionUserSavesFailedAction();
}

@immutable
class SaveQuestionAction extends AppAction{
  final QuestionState question;
  const SaveQuestionAction({required this.question});
}
@immutable
class SaveQuestionSuccessAction extends AppAction{
  final QuestionUserSaveState questionUserSave;
  const SaveQuestionSuccessAction({required this.questionUserSave});
}

@immutable
class UnsaveQuestionAction extends AppAction{
  final QuestionState question;
  const UnsaveQuestionAction({required this.question});
}
@immutable
class UnsaveQuestionSuccessAction extends AppAction{
  final QuestionState question;
  const UnsaveQuestionSuccessAction({required this.question});
} 
//question user saves



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
//subject questions
