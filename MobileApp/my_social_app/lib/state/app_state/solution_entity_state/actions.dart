import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';


@immutable
class CreateSolutionAction extends AppAction{
  final String id;
  final num questionId;
  final String? content;
  final Iterable<AppFile> medias;
  const CreateSolutionAction({required this.id, required this.questionId, required this.content, required this.medias});
}
@immutable
class CreateSolutionByAIAction extends AppAction{
  final String model;
  final num questionId;
  final String? blobName;
  final double? position;
  final String? prompt;
  const CreateSolutionByAIAction({
    required this.model,
    required this.questionId,
    required this.blobName,
    required this.position,
    required this.prompt
  });
}

@immutable
class LoadSolutionAction extends AppAction{
  final num solutionId;
  const LoadSolutionAction({required this.solutionId});
}
@immutable
class AddSolutionAction extends AppAction{
  final SolutionState solution;
  const AddSolutionAction({required this.solution});
}
@immutable
class AddSolutionsAction extends AppAction{
  final Iterable<SolutionState> solutions;
  const AddSolutionsAction({required this.solutions});
}
@immutable
class RemoveSolutionAction extends AppAction{
  final SolutionState solution;
  const RemoveSolutionAction({required this.solution});
}
@immutable
class RemoveSolutionSuccessAction extends AppAction{
  final num solutionId;
  const RemoveSolutionSuccessAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteAction extends AppAction{
  final num solutionId;
  const MakeSolutionUpvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteSuccessAction extends AppAction{
  final num solutionId;
  final num upvoteId;
  final num downvoteId;

  const MakeSolutionUpvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable 
class RemoveSolutionUpvoteAction extends AppAction{
  final num solutionId;
  const RemoveSolutionUpvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionUpvoteSuccessAction extends AppAction{
  final num solutionId;
  final num voteId;
  const RemoveSolutionUpvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionUpvoteAction extends AppAction{
  final num solutionId;
  final num voteId;
  const AddNewSolutionUpvoteAction({required this.solutionId, required this.voteId});
}
@immutable
class MakeSolutionDownvoteAction extends AppAction{
  final num solutionId;
  const MakeSolutionDownvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends AppAction{
  final num solutionId;
  final num upvoteId;
  final num downvoteId;
  const MakeSolutionDownvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable
class RemoveSolutionDownvoteAction extends AppAction{
  final num solutionId;
  const RemoveSolutionDownvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionDownvoteSuccessAction extends AppAction{
  final num solutionId;
  final num voteId;
  const RemoveSolutionDownvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionDownvoteAction extends AppAction{
  final num solutionId;
  final num voteId;
  const AddNewSolutionDownvoteAction({required this.solutionId, required this.voteId});
}

//upvotes
@immutable
class NextSolutionUpvotesAction extends AppAction{
  final num solutionId;
  const NextSolutionUpvotesAction({required this.solutionId});
}
@immutable
class NextSolutionUpvotesSuccessAction extends AppAction{
  final num solutionId;
  final Iterable<num> voteIds;
  const NextSolutionUpvotesSuccessAction({required this.solutionId, required this.voteIds});
}
@immutable
class NextSolutionUpvotesFailedAction extends AppAction{
  final num solutionId;
  const NextSolutionUpvotesFailedAction({required this.solutionId});
}

//downvotes
@immutable
class NextSolutionDownvotesAction extends AppAction{
  final num solutionId;
  const NextSolutionDownvotesAction({required this.solutionId});
}
@immutable
class NextSolutionDownvotesSuccessAction extends AppAction{
  final num solutionId;
  final Iterable<num> voteIds;
  const NextSolutionDownvotesSuccessAction({required this.solutionId, required this.voteIds});
}
@immutable
class NextSolutionDownvotesFailedAction extends AppAction{
  final num solutionId;
  const NextSolutionDownvotesFailedAction({required this.solutionId});
}

@immutable
class NextSolutionCommentsAction extends AppAction{
  final num solutionId;
  const NextSolutionCommentsAction({required this.solutionId});
}
@immutable
class NextSolutionCommentsSuccessAction extends AppAction{
  final num solutionId;
  final Iterable<num> commentsIds;
  const NextSolutionCommentsSuccessAction({required this.solutionId, required this.commentsIds});
}
@immutable
class NextSolutionCommentsFailedAction extends AppAction{
  final num solutionId;
  const NextSolutionCommentsFailedAction({required this.solutionId});
}

@immutable
class AddSolutionCommentAction extends AppAction{
  final num solutionId;
  final num commentId;
  const AddSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class RemoveSolutionCommentAction extends AppAction{
  final num solutionId;
  final num commentId;
  const RemoveSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class AddNewSolutionCommentAction extends AppAction{
  final num solutionId;
  final num commentId;
  const AddNewSolutionCommentAction({required this.solutionId, required this.commentId});
}

@immutable
class MarkSolutionAsCorrectAction extends AppAction{
  final num questionId;
  final num solutionId;
  const MarkSolutionAsCorrectAction({required this.questionId,required this.solutionId,});
}
@immutable
class MarkSolutionAsCorrectSuccessAction extends AppAction{
  final num solutionId;
  const MarkSolutionAsCorrectSuccessAction({required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectAction extends AppAction{
  final num questionId;
  final num solutionId;
  const MarkSolutionAsIncorrectAction({required this.questionId, required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectSuccessAction extends AppAction{
  final num solutionId;
  const MarkSolutionAsIncorrectSuccessAction({required this.solutionId});
}

@immutable
class SaveSolutionAction extends AppAction{
  final num solutionId;
  const SaveSolutionAction({required this.solutionId});
}
@immutable
class SaveSolutionSuccessAction extends AppAction{
  final num solutionId;
  const SaveSolutionSuccessAction({required this.solutionId});
}

@immutable
class UnsaveSolutionAction extends AppAction{
  final num solutionId;
  const UnsaveSolutionAction({required this.solutionId});
}
@immutable
class UnsaveSolutionSuccessAction extends AppAction{
  final num solutionId;
  const UnsaveSolutionSuccessAction({required this.solutionId});
}