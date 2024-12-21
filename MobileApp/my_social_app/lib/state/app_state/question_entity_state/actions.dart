import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class CreateQuestionAction extends AppAction{
  final int examId;
  final int subjectId;
  final int? topicId;
  final String content;
  final Iterable<XFile> images;

  const CreateQuestionAction({
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.content,
    required this.images
  });
}

@immutable
class LoadQuestionAction extends AppAction{
  final int questionId;
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
class DeleteQuestionAction extends AppAction{
  final int questionId;
  const DeleteQuestionAction({required this.questionId});
}
@immutable
class DeleteQuestionSuccessAction extends AppAction{
  final int questionId;
  const DeleteQuestionSuccessAction({required this.questionId});
}

@immutable
class DislikeQuestionAction extends AppAction{
  final int questionId;
  const DislikeQuestionAction({required this.questionId});
}
@immutable
class DislikeQuestionSuccessAction extends AppAction{
  final int questionId;
  final int likeId;
  const DislikeQuestionSuccessAction({required this.questionId,required this.likeId});
}
@immutable
class LikeQuestionAction extends AppAction{
  final int questionId;
  const LikeQuestionAction({required this.questionId});
}
@immutable
class LikeQuestionSuccessAction extends AppAction{
  final int questionId;
  final int likeId;
  const LikeQuestionSuccessAction({required this.questionId,required this.likeId});
}
@immutable
class AddNewQuestionLikeAction extends AppAction{
  final int questionId;
  final int likeId;
  const AddNewQuestionLikeAction({required this.questionId, required this.likeId});
}


@immutable
class NextQuestionLikesAction extends AppAction{
  final int questionId;
  const NextQuestionLikesAction({required this.questionId});
}
@immutable
class NextQuestionLikesSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> likeIds;
  const NextQuestionLikesSuccessAction({required this.questionId, required this.likeIds});
}
@immutable
class NextQuestionLikesFailedAction extends AppAction{
  final int questionId;
  const NextQuestionLikesFailedAction({required this.questionId});
}

@immutable
class MarkQuestionSolutionAsCorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsCorrectAction({required this.questionId,required this.solutionId});
}
@immutable
class MarkQuestionSolutionAsIncorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsIncorrectAction({required this.questionId,required this.solutionId});
}


@immutable
class NextQuestionSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionSolutionsFailedAction({required this.questionId});
}

@immutable
class CreateNewQuestionSolutionAction extends AppAction{
  final SolutionState solution;
  const CreateNewQuestionSolutionAction({required this.solution});
}
@immutable
class CreateNewQuestionVideoSolutionAction extends AppAction{
  final SolutionState solution;
  const CreateNewQuestionVideoSolutionAction({required this.solution});
}
@immutable
class AddNewQuestionSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const AddNewQuestionSolutionAction({required this.questionId, required this.solutionId});
}
@immutable
class RemoveQuestionSolutionAction extends AppAction{
  final SolutionState solution;
  const RemoveQuestionSolutionAction({required this.solution});
}

@immutable
class NextQuestionCorrectSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionCorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionCorrectSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionCorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionCorrectSolutionsFailedAction({required this.questionId});
}
@immutable
class RemoveCorrectSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const RemoveCorrectSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class NextQuestionPendingSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionPendingSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionPendingSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionPendingSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionPendingSolutionsFailedAction({required this.questionId});
}

@immutable
class NextQuestionIncorrectSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionIncorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionIncorrectSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionIncorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionIncorrectSolutionsFailedAction({required this.questionId});
}

@immutable
class NextQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionVideoSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionVideoSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionVideoSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsFailedAction({required this.questionId});
}
@immutable
class AddQuestionVideoSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const AddQuestionVideoSolutionAction({required this.questionId, required this.solutionId});
}
@immutable
class RemoveQuestionVideoSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const RemoveQuestionVideoSolutionAction({required this.questionId, required this.solutionId});
}


@immutable
class NextQuestionCommentsAction extends AppAction{
  final int questionId;
  const NextQuestionCommentsAction({required this.questionId});
}
@immutable
class NexQuestionCommentsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> commentIds;
  const NexQuestionCommentsSuccessAction({required this.questionId,required this.commentIds});
}
@immutable
class NextQuestionCommentsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionCommentsFailedAction({required this.questionId});
}
@immutable
class AddQuestionCommentAction extends AppAction{
  final int commenId;
  final int questionId;
  const AddQuestionCommentAction({required this.commenId, required this.questionId});
}
@immutable
class RemoveQuestionCommentAction extends AppAction{
  final int commentId;
  final int questionid;
  const RemoveQuestionCommentAction({required this.commentId, required this.questionid});
}
@immutable
class AddNewQuestionCommentAction extends AppAction{
  final int questionId;
  final int commentId;
  const AddNewQuestionCommentAction({required this.questionId, required this.commentId});
}


@immutable
class SaveQuestionAction extends AppAction{
  final int questionId;
  const SaveQuestionAction({required this.questionId});
}
@immutable
class SaveQuestionSuccessAction extends AppAction{
  final int questionId;
  const SaveQuestionSuccessAction({required this.questionId});
}
@immutable
class UnsaveQuestionAction extends AppAction{
  final int questionId;
  const UnsaveQuestionAction({required this.questionId});
}
@immutable
class UnsaveQuestionSuccessAction extends AppAction{
  final int questionId;
  const UnsaveQuestionSuccessAction({required this.questionId});
}

@immutable
class ChangeUploadingSolutionRateAction extends AppAction{
  final UploadingSolutionState state;
  final double rate;
  const ChangeUploadingSolutionRateAction({required this.state, required this.rate});
}
@immutable
class ChangeUploadingSolutionStatusAction extends AppAction{
  final UploadingSolutionState state;
  final UploadingFileStatus status;
  const ChangeUploadingSolutionStatusAction({required this.state, required this.status});
}
@immutable
class RemoveUploadedSolutionAction extends AppAction{
  final UploadingSolutionState state;
  const RemoveUploadedSolutionAction({required this.state});
}
