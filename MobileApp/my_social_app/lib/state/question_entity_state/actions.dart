import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/question_entity_state/question_state.dart';

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
class AddQuestionCommentAction extends redux.Action{
  final int commenId;
  final int questionId;
  const AddQuestionCommentAction({required this.commenId, required this.questionId});
}
@immutable
class NextPageQuestionCommentsAction extends redux.Action{
  final int questionId;
  const NextPageQuestionCommentsAction({required this.questionId});
}
@immutable
class NextPageQuestionCommentsSuccessAciton extends redux.Action{
  final int questionId;
  final Iterable<int> questionCommentIds;
  const NextPageQuestionCommentsSuccessAciton({required this.questionId,required this.questionCommentIds});
}
@immutable
class NextPageQuestionCommentsIfNoQuestionComments extends redux.Action{
  final int questionId;
  const NextPageQuestionCommentsIfNoQuestionComments({required this.questionId});
}