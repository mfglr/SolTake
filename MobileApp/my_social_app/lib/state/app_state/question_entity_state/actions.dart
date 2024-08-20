import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

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
class LikeQuestionAction extends redux.Action{
  final int questionId;
  const LikeQuestionAction({required this.questionId});
}
@immutable
class LikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  const LikeQuestionSuccessAction({required this.questionId});
}

@immutable
class DislikeQuestionAction extends redux.Action{
  final int questionId;
  const DislikeQuestionAction({required this.questionId});
}
@immutable
class DislikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  const DislikeQuestionSuccessAction({required this.questionId});
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
class AddQuestionSolutionAction extends redux.Action{
  final int solutionId;
  final int questionId;
  const AddQuestionSolutionAction({required this.solutionId, required this.questionId});
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