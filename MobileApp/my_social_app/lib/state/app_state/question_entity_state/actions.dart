import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class LoadQuestionAction extends redux.Action{
  final int questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class AddQuestionAction extends redux.Action{
  final QuestionState value;
  const AddQuestionAction({required this.value});
}
@immutable
class AddQuestionsAction extends redux.Action{
  final Iterable<QuestionState> questions;
  const AddQuestionsAction({required this.questions});
}


@immutable
class DislikeQuestionAction extends redux.Action{
  final int questionId;
  const DislikeQuestionAction({required this.questionId});
}
@immutable
class DislikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  final int likeId;
  const DislikeQuestionSuccessAction({required this.questionId,required this.likeId});
}
@immutable
class LikeQuestionAction extends redux.Action{
  final int questionId;
  const LikeQuestionAction({required this.questionId});
}
@immutable
class LikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  final int likeId;
  const LikeQuestionSuccessAction({required this.questionId,required this.likeId});
}
@immutable
class AddNewQuestionLikeAction extends redux.Action{
  final int questionId;
  final int likeId;
  const AddNewQuestionLikeAction({required this.questionId, required this.likeId});
}

@immutable
class GetNextPageQuestionLikesIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionLikesIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionLikesIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionLikesIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionLikesAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionLikesAction({required this.questionId});
}
@immutable
class AddNextPageQuestionLikesAction extends redux.Action{
  final int questionId;
  final Iterable<int> likeIds;
  const AddNextPageQuestionLikesAction({required this.questionId, required this.likeIds});
}

@immutable
class MarkQuestionSolutionAsCorrectAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsCorrectAction({required this.questionId,required this.solutionId});
}
@immutable
class MarkQuestionSolutionAsIncorrectAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsIncorrectAction({required this.questionId,required this.solutionId});
}

@immutable
class GetNextPageQuestionSolutionsIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionSolutionsAction extends redux.Action{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionSolutionsAction({required this.questionId, required this.solutionIds});
}
@immutable
class CreateNewQuestionSolutionAction extends redux.Action{
  final SolutionState solution;
  const CreateNewQuestionSolutionAction({required this.solution});
}
@immutable
class AddNewQuestionSolutionAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const AddNewQuestionSolutionAction({required this.questionId, required this.solutionId});
}
@immutable
class RemoveQuestionSolutionAction extends redux.Action{
  final SolutionState solution;
  const RemoveQuestionSolutionAction({required this.solution});
}

@immutable
class GetNextPageQuestionCorrectSolutionsIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCorrectSolutionsIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCorrectSolutionsAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionCorrectSolutionsAction extends redux.Action{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionCorrectSolutionsAction({required this.questionId, required this.solutionIds});
}
@immutable
class RemoveCorrectSolutionAction extends redux.Action{
  final int questionId;
  final int solutionId;
  const RemoveCorrectSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class GetNextPageQuestionPendingSolutionsIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionPendingSolutionsIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionPendingSolutionsAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionPendingSolutionsAction extends redux.Action{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionPendingSolutionsAction({required this.questionId, required this.solutionIds});
}

@immutable
class GetNextPageQuestionIncorrectSolutionsIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionIncorrectSolutionsIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionIncorrectSolutionsAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionIncorrectSolutionsAction extends redux.Action{
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionIncorrectSolutionsAction({required this.questionId, required this.solutionIds});
}

@immutable
class GetNextPageQuestionCommentsIfNoPageAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCommentsIfNoPageAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsIfReadyAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCommentsIfReadyAction({required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsAction extends redux.Action{
  final int questionId;
  const GetNextPageQuestionCommentsAction({required this.questionId});
}
@immutable
class AddNextPageQuestionCommentsAction extends redux.Action{
  final int questionId;
  final Iterable<int> commentIds;
  const AddNextPageQuestionCommentsAction({required this.questionId,required this.commentIds});
}
@immutable
class AddQuestionCommentAction extends redux.Action{
  final int commenId;
  final int questionId;
  const AddQuestionCommentAction({required this.commenId, required this.questionId});
}
@immutable
class RemoveQuestionCommentAction extends redux.Action{
  final int commentId;
  final int questionid;
  const RemoveQuestionCommentAction({required this.commentId, required this.questionid});
}
@immutable
class AddNewQuestionCommentAction extends redux.Action{
  final int questionId;
  final int commentId;
  const AddNewQuestionCommentAction({required this.questionId, required this.commentId});
}
@immutable
class AddNewQuestionCommentSuccessAction extends redux.Action{
  final int questionId;
  final int commentId;
  const AddNewQuestionCommentSuccessAction({required this.questionId, required this.commentId});
}


@immutable
class LoadQuestionImageAction extends redux.Action{
  final int questionId;
  final int index;
  const LoadQuestionImageAction({required this.questionId, required this.index});
}
@immutable
class LoadQuestionImageSuccessAction extends redux.Action{
  final int questionId;
  final int index;
  final Uint8List image;
  const LoadQuestionImageSuccessAction({required this.questionId, required this.index,required this.image});
}
