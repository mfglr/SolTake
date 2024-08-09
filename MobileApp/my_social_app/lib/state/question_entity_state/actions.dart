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
class AddQuestionSolutionAction extends redux.Action{
  final int solutionId;
  final int questionId;
  const AddQuestionSolutionAction({required this.solutionId, required this.questionId});
}
@immutable
class NextPageQuestionSolutionsAction extends redux.Action{
  final int questionId;
  const NextPageQuestionSolutionsAction({required this.questionId});
}
@immutable
class NextPageQuestionSolutionsSuccessAction extends redux.Action{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextPageQuestionSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextPageQuestionSolutionsIfNoSolutionsAction extends redux.Action{
  final int questionId;
  const NextPageQuestionSolutionsIfNoSolutionsAction({required this.questionId});
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