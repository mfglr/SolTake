import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/question_entity_state/question_state.dart';

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
  final int offset;
  final int questionId;
  const GetNextPageQuestionSolutionsIfNoPageAction({required this.offset,required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsIfReadyAction extends redux.Action{
  final int offset;
  final int questionId;
  const GetNextPageQuestionSolutionsIfReadyAction({required this.offset,required this.questionId});
}
@immutable
class GetNextPageQuestionSolutionsAction extends redux.Action{
  final int offset;
  final int questionId;
  const GetNextPageQuestionSolutionsAction({required this.offset,required this.questionId});
}
@immutable
class AddNextPageQuestionSolutionsAction extends redux.Action{
  final int offset;
  final int questionId;
  final Iterable<int> solutionIds;
  const AddNextPageQuestionSolutionsAction({required this.offset,required this.questionId, required this.solutionIds});
}
@immutable
class AddQuestionSolutionAction extends redux.Action{
  final int offset;
  final int solutionId;
  final int questionId;
  const AddQuestionSolutionAction({required this.offset,required this.solutionId, required this.questionId});
}
@immutable
class AddQuestionSolutionsPaginationAction extends redux.Action{
  final int offset;
  final int questionId;
  const AddQuestionSolutionsPaginationAction({required this.offset, required this.questionId});
}
@immutable
class AddQuestionSolutionsPaginationSuccessAction extends redux.Action{
  final int offset;
  final int questionId;
  const AddQuestionSolutionsPaginationSuccessAction({required this.offset, required this.questionId});
}

@immutable
class GetNextPageQuestionCommentsIfNoPageAction extends redux.Action{
  final int offset;
  final int questionId;
  const GetNextPageQuestionCommentsIfNoPageAction({required this.offset, required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsIfReadyAction extends redux.Action{
  final int offset;
  final int questionId;
  const GetNextPageQuestionCommentsIfReadyAction({required this.offset, required this.questionId});
}
@immutable
class GetNextPageQuestionCommentsAction extends redux.Action{
  final int offset;
  final int questionId;
  const GetNextPageQuestionCommentsAction({required this.offset,required this.questionId});
}
@immutable
class AddNextPageQuestionCommentsAction extends redux.Action{
  final int offset;
  final int questionId;
  final Iterable<int> commentIds;
  const AddNextPageQuestionCommentsAction({required this.offset, required this.questionId,required this.commentIds});
}
@immutable
class AddQuestionCommentAction extends redux.Action{
  final int offset;
  final int commenId;
  final int questionId;
  const AddQuestionCommentAction({required this.offset, required this.commenId, required this.questionId});
}
@immutable
class AddQuestionCommentsPaginationAction extends redux.Action{
  final int offset;
  final int questionId;
  const AddQuestionCommentsPaginationAction({required this.offset, required this.questionId});
}
@immutable
class AddQuestionCommentsPaginationSuccessAction extends redux.Action{
  final int offset;
  final int questionId;
  const AddQuestionCommentsPaginationSuccessAction({required this.offset, required this.questionId});
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