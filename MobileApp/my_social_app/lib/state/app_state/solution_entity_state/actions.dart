import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';


@immutable
class CreateSolutionAction extends AppAction{
  final String id;
  final int questionId;
  final String? content;
  final Iterable<XFile> images;
  const CreateSolutionAction({required this.id, required this.questionId, required this.content, required this.images});
}
@immutable
class CreateVideoSolutionAction extends AppAction{
  final String id;
  final int questionId;
  final String? content;
  final XFile video;
  const CreateVideoSolutionAction({required this.id, required this.questionId, required this.content, required this.video});
}
@immutable
class LoadSolutionAction extends AppAction{
  final int solutionId;
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
  final int solutionId;
  const RemoveSolutionSuccessAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteAction extends AppAction{
  final int solutionId;
  const MakeSolutionUpvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionUpvoteSuccessAction extends AppAction{
  final int solutionId;
  final int upvoteId;
  final int downvoteId;

  const MakeSolutionUpvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable 
class RemoveSolutionUpvoteAction extends AppAction{
  final int solutionId;
  const RemoveSolutionUpvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionUpvoteSuccessAction extends AppAction{
  final int solutionId;
  final int voteId;
  const RemoveSolutionUpvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionUpvoteAction extends AppAction{
  final int solutionId;
  final int voteId;
  const AddNewSolutionUpvoteAction({required this.solutionId, required this.voteId});
}
@immutable
class MakeSolutionDownvoteAction extends AppAction{
  final int solutionId;
  const MakeSolutionDownvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends AppAction{
  final int solutionId;
  final int upvoteId;
  final int downvoteId;
  const MakeSolutionDownvoteSuccessAction({
    required this.solutionId,
    required this.upvoteId,
    required this.downvoteId
  });
}
@immutable
class RemoveSolutionDownvoteAction extends AppAction{
  final int solutionId;
  const RemoveSolutionDownvoteAction({required this.solutionId});
}
@immutable
class RemoveSolutionDownvoteSuccessAction extends AppAction{
  final int solutionId;
  final int voteId;
  const RemoveSolutionDownvoteSuccessAction({required this.solutionId,required this.voteId});
}
@immutable
class AddNewSolutionDownvoteAction extends AppAction{
  final int solutionId;
  final int voteId;
  const AddNewSolutionDownvoteAction({required this.solutionId, required this.voteId});
}

//upvotes
@immutable
class NextSolutionUpvotesAction extends AppAction{
  final int solutionId;
  const NextSolutionUpvotesAction({required this.solutionId});
}
@immutable
class NextSolutionUpvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<int> voteIds;
  const NextSolutionUpvotesSuccessAction({required this.solutionId, required this.voteIds});
}
@immutable
class NextSolutionUpvotesFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionUpvotesFailedAction({required this.solutionId});
}

//downvotes
@immutable
class NextSolutionDownvotesAction extends AppAction{
  final int solutionId;
  const NextSolutionDownvotesAction({required this.solutionId});
}
@immutable
class NextSolutionDownvotesSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<int> voteIds;
  const NextSolutionDownvotesSuccessAction({required this.solutionId, required this.voteIds});
}
@immutable
class NextSolutionDownvotesFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionDownvotesFailedAction({required this.solutionId});
}

@immutable
class NextSolutionCommentsAction extends AppAction{
  final int solutionId;
  const NextSolutionCommentsAction({required this.solutionId});
}
@immutable
class NextSolutionCommentsSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<int> commentsIds;
  const NextSolutionCommentsSuccessAction({required this.solutionId, required this.commentsIds});
}
@immutable
class NextSolutionCommentsFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionCommentsFailedAction({required this.solutionId});
}

@immutable
class AddSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const AddSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class RemoveSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const RemoveSolutionCommentAction({required this.solutionId, required this.commentId});
}
@immutable
class AddNewSolutionCommentAction extends AppAction{
  final int solutionId;
  final int commentId;
  const AddNewSolutionCommentAction({required this.solutionId, required this.commentId});
}

@immutable
class MarkSolutionAsCorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsCorrectAction({required this.questionId,required this.solutionId,});
}
@immutable
class MarkSolutionAsCorrectSuccessAction extends AppAction{
  final int solutionId;
  const MarkSolutionAsCorrectSuccessAction({required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkSolutionAsIncorrectAction({required this.questionId, required this.solutionId});
}
@immutable
class MarkSolutionAsIncorrectSuccessAction extends AppAction{
  final int solutionId;
  const MarkSolutionAsIncorrectSuccessAction({required this.solutionId});
}

@immutable
class SaveSolutionAction extends AppAction{
  final int solutionId;
  const SaveSolutionAction({required this.solutionId});
}
@immutable
class SaveSolutionSuccessAction extends AppAction{
  final int solutionId;
  const SaveSolutionSuccessAction({required this.solutionId});
}

@immutable
class UnsaveSolutionAction extends AppAction{
  final int solutionId;
  const UnsaveSolutionAction({required this.solutionId});
}
@immutable
class UnsaveSolutionSuccessAction extends AppAction{
  final int solutionId;
  const UnsaveSolutionSuccessAction({required this.solutionId});
}