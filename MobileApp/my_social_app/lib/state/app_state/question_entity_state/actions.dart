import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

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
class DeleteQuestionAction extends AppAction{
  final num questionId;
  const DeleteQuestionAction({required this.questionId});
}
@immutable
class DeleteQuestionSuccessAction extends AppAction{
  final num questionId;
  const DeleteQuestionSuccessAction({required this.questionId});
}

@immutable
class LoadQuestionAction extends AppAction{
  final num questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class AddQuestionAction extends AppAction{
  final QuestionState value;
  const AddQuestionAction({required this.value});
}
@immutable
class AddQuestionsAction extends AppAction{
  final Iterable<QuestionState> questions;
  const AddQuestionsAction({required this.questions});
}


@immutable
class DislikeQuestionAction extends AppAction{
  final num questionId;
  const DislikeQuestionAction({required this.questionId});
}
@immutable
class DislikeQuestionSuccessAction extends AppAction{
  final num questionId;
  final num userId;
  const DislikeQuestionSuccessAction({
    required this.questionId,
    required this.userId
  });
}
@immutable
class LikeQuestionAction extends AppAction{
  final num questionId;
  const LikeQuestionAction({required this.questionId});
}
@immutable
class LikeQuestionSuccessAction extends AppAction{
  final num questionId;
  final QuestionUserLikeState like;
  const LikeQuestionSuccessAction({required this.questionId, required this.like});
}
@immutable
class AddNewQuestionLikeAction extends AppAction{
  final num questionId;
  final QuestionUserLikeState like;
  const AddNewQuestionLikeAction({required this.questionId, required this.like});
}


@immutable
class NextQuestionLikesAction extends AppAction{
  final num questionId;
  const NextQuestionLikesAction({required this.questionId});
}
@immutable
class NextQuestionLikesSuccessAction extends AppAction{
  final num questionId;
  final Iterable<QuestionUserLikeState> likes;
  const NextQuestionLikesSuccessAction({required this.questionId, required this.likes});
}
@immutable
class NextQuestionLikesFailedAction extends AppAction{
  final num questionId;
  const NextQuestionLikesFailedAction({required this.questionId});
}

@immutable
class MarkQuestionSolutionAsCorrectAction extends AppAction{
  final num questionId;
  final num solutionId;
  const MarkQuestionSolutionAsCorrectAction({required this.questionId,required this.solutionId});
}
@immutable
class MarkQuestionSolutionAsIncorrectAction extends AppAction{
  final num questionId;
  final num solutionId;
  const MarkQuestionSolutionAsIncorrectAction({required this.questionId,required this.solutionId});
}


@immutable
class NextQuestionSolutionsAction extends AppAction{
  final num questionId;
  const NextQuestionSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionSolutionsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> solutionIds;
  const NextQuestionSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionSolutionsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionSolutionsFailedAction({required this.questionId});
}

@immutable
class CreateNewQuestionSolutionAction extends AppAction{
  final num questionId;
  final num solutionId;
  const CreateNewQuestionSolutionAction({required this.questionId,required this.solutionId});
}
@immutable
class CreateNewQuestionVideoSolutionAction extends AppAction{
  final num questionId;
  final num solutionId;
  const CreateNewQuestionVideoSolutionAction({required this.questionId,required this.solutionId});
}
@immutable
class AddNewQuestionSolutionAction extends AppAction{
  final num questionId;
  final num solutionId;
  const AddNewQuestionSolutionAction({required this.questionId, required this.solutionId});
}
@immutable
class RemoveQuestionSolutionAction extends AppAction{
  final SolutionState solution;
  const RemoveQuestionSolutionAction({required this.solution});
}

@immutable
class NextQuestionCorrectSolutionsAction extends AppAction{
  final num questionId;
  const NextQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionCorrectSolutionsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> solutionIds;
  const NextQuestionCorrectSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionCorrectSolutionsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionCorrectSolutionsFailedAction({required this.questionId});
}
@immutable
class RemoveCorrectSolutionAction extends AppAction{
  final num questionId;
  final num solutionId;
  const RemoveCorrectSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class NextQuestionPendingSolutionsAction extends AppAction{
  final num questionId;
  const NextQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionPendingSolutionsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> solutionIds;
  const NextQuestionPendingSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionPendingSolutionsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionPendingSolutionsFailedAction({required this.questionId});
}

@immutable
class NextQuestionIncorrectSolutionsAction extends AppAction{
  final num questionId;
  const NextQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionIncorrectSolutionsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> solutionIds;
  const NextQuestionIncorrectSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionIncorrectSolutionsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionIncorrectSolutionsFailedAction({required this.questionId});
}

@immutable
class NextQuestionVideoSolutionsAction extends AppAction{
  final num questionId;
  const NextQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionVideoSolutionsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> solutionIds;
  const NextQuestionVideoSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionVideoSolutionsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionVideoSolutionsFailedAction({required this.questionId});
}
@immutable
class AddQuestionVideoSolutionAction extends AppAction{
  final num questionId;
  final num solutionId;
  const AddQuestionVideoSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class NextQuestionCommentsAction extends AppAction{
  final num questionId;
  const NextQuestionCommentsAction({required this.questionId});
}
@immutable
class NexQuestionCommentsSuccessAction extends AppAction{
  final num questionId;
  final Iterable<num> commentIds;
  const NexQuestionCommentsSuccessAction({required this.questionId,required this.commentIds});
}
@immutable
class NextQuestionCommentsFailedAction extends AppAction{
  final num questionId;
  const NextQuestionCommentsFailedAction({required this.questionId});
}

@immutable
class AddQuestionCommentAction extends AppAction{
  final num questionId;
  final num commenId;
  const AddQuestionCommentAction({required this.questionId,required this.commenId});
}
@immutable
class RemoveQuestionCommentAction extends AppAction{
  final num questionid;
  final num commentId;
  const RemoveQuestionCommentAction({required this.commentId, required this.questionid});
}
@immutable
class AddNewQuestionCommentAction extends AppAction{
  final num questionId;
  final num commentId;
  const AddNewQuestionCommentAction({required this.questionId, required this.commentId});
}


// @immutable
// class SaveQuestionAction extends AppAction{
//   final num questionId;
//   const SaveQuestionAction({required this.questionId});
// }
// @immutable
// class SaveQuestionSuccessAction extends AppAction{
//   final num questionId;
//   const SaveQuestionSuccessAction({required this.questionId});
// }
// @immutable
// class UnsaveQuestionAction extends AppAction{
//   final num questionId;
//   const UnsaveQuestionAction({required this.questionId});
// }
// @immutable
// class UnsaveQuestionSuccessAction extends AppAction{
//   final num questionId;
//   const UnsaveQuestionSuccessAction({required this.questionId});
// }
