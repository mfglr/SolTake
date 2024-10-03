import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class CreateQuestionAction extends AppAction{
  final int examId;
  final int subjectId;
  final Iterable<int> topicIds;
  final String content;
  final Iterable<XFile> images;

  const CreateQuestionAction({
    required this.examId,
    required this.subjectId,
    required this.topicIds,
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
class GetNextPageQuestionLikesIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionLikesIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionLikesIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionLikesIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionLikesAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionLikesAction({required this.questionId});
}
@immutable
class AddNextPageQuestionLikesAction extends AppAction{
  final int questionId;
  final Iterable<int> likeIds;
  const AddNextPageQuestionLikesAction({required this.questionId, required this.likeIds});
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
class GetNextPageQuestionSolutionsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionSolutionsAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionSolutionsAction({required this.questionId, required this.solutionIds});
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
class GetNextPageQuestionCorrectSolutionsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCorrectSolutionsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCorrectSolutionsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionCorrectSolutionsAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionCorrectSolutionsAction({required this.questionId, required this.solutionIds});
}
@immutable
class RemoveCorrectSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const RemoveCorrectSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class GetNextPageQuestionPendingSolutionsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionPendingSolutionsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionPendingSolutionsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionPendingSolutionsAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionPendingSolutionsAction({required this.questionId, required this.solutionIds});
}

@immutable
class GetNextPageQuestionIncorrectSolutionsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionIncorrectSolutionsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionIncorrectSolutionsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionIncorrectSolutionsAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionIncorrectSolutionsAction({required this.questionId, required this.solutionIds});
}

@immutable
class GetNextPageQuestionVideoSolutionsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionVideoSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionVideoSolutionsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionVideoSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionVideoSolutionsAction({required this.questionId, required this.solutionIds});
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
class GetNextPageQuestionCommentsIfNoPageAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCommentsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsIfReadyAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCommentsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsAction extends AppAction{
  final int questionId;
  const GetNextPageQuestionCommentsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionCommentsAction extends AppAction{
  final int questionId;
  final Iterable<int> commentIds;
  const AddNextPageQuestionCommentsAction({required this.questionId,required this.commentIds});
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
class LoadQuestionImageAction extends AppAction{
  final int questionId;
  final int index;
  const LoadQuestionImageAction({required this.questionId, required this.index});
}
@immutable
class LoadQuestionImageSuccessAction extends AppAction{
  final int questionId;
  final int index;
  final Uint8List image;
  const LoadQuestionImageSuccessAction({required this.questionId, required this.index,required this.image});
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

