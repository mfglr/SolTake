import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';


@immutable
class CreateSolutionAction extends AppAction{
  final String id;
  final int questionId;
  final String? content;
  final Iterable<AppFile> medias;
  const CreateSolutionAction({required this.id, required this.questionId, required this.content, required this.medias});
}
@immutable
class CreateSolutionByAIAction extends AppAction{
  final int modelId;
  final int questionId;
  final String? blobName;
  final double? position;
  final String? prompt;
  final bool isHighResulation;

  const CreateSolutionByAIAction({
    required this.modelId,
    required this.questionId,
    required this.blobName,
    required this.position,
    required this.prompt,
    required this.isHighResulation
  });
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
  final SolutionUserVoteState solutionUserVoteState;
  const MakeSolutionUpvoteSuccessAction({
    required this.solutionId,
    required this.solutionUserVoteState
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
  final int userId;
  const RemoveSolutionUpvoteSuccessAction({required this.solutionId,required this.userId});
}
@immutable
class AddNewSolutionUpvoteAction extends AppAction{
  final int solutionId;
  final SolutionUserVoteState solutionUserVote;
  const AddNewSolutionUpvoteAction({required this.solutionId, required this.solutionUserVote});
}
@immutable
class MakeSolutionDownvoteAction extends AppAction{
  final int solutionId;
  const MakeSolutionDownvoteAction({required this.solutionId});
}
@immutable
class MakeSolutionDownvoteSuccessAction extends AppAction{
  final int solutionId;
  final SolutionUserVoteState solutionUserVote;
  const MakeSolutionDownvoteSuccessAction({
    required this.solutionId,
    required this.solutionUserVote,
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
  final int userId;
  const RemoveSolutionDownvoteSuccessAction({required this.solutionId,required this.userId});
}
@immutable
class AddNewSolutionDownvoteAction extends AppAction{
  final int solutionId;
  final SolutionUserVoteState solutionUserVoteState;
  const AddNewSolutionDownvoteAction({required this.solutionId, required this.solutionUserVoteState});
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
  final Iterable<SolutionUserVoteState> votes;
  const NextSolutionUpvotesSuccessAction({required this.solutionId, required this.votes});
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
  final Iterable<SolutionUserVoteState> votes;
  const NextSolutionDownvotesSuccessAction({required this.solutionId, required this.votes});
}
@immutable
class NextSolutionDownvotesFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionDownvotesFailedAction({required this.solutionId});
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
class UnsaveSolutionAction extends AppAction{
  final int solutionId;
  const UnsaveSolutionAction({required this.solutionId});
}
