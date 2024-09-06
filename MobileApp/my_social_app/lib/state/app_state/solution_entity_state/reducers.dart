import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
import 'package:redux/redux.dart';

SolutionEntityState addSolutionReducer(SolutionEntityState prev, AddSolutionAction action)
  => SolutionEntityState(entities: prev.appendOne(action.solution));
SolutionEntityState addSolutionsReducer(SolutionEntityState prev, AddSolutionsAction action)
  => SolutionEntityState(entities: prev.appendMany(action.solutions));
SolutionEntityState removeSolutionReducer(SolutionEntityState prev,RemoveSolutionSuccessAction action)
  => SolutionEntityState(entities: prev.removeOne(action.solutionId));

SolutionEntityState getNextPageUpvotesReducer(SolutionEntityState prev,GetNextPageSolutionUpvotesAction action)
  => prev.startLoadinNextUpvotes(action.solutionId);
SolutionEntityState addNextPageUpvotesReducer(SolutionEntityState prev,AddNextPageSolutionUpvatesAction action)
  => prev.addNextPageUpvotes(action.solutionId, action.voteIds);
SolutionEntityState makeUpvoteReducer(SolutionEntityState prev,MakeSolutionUpvoteSuccessAction action)
  => prev.makeUpvote(action.solutionId,action.upvoteId,action.downvoteId);
SolutionEntityState removeUpvoteReducer(SolutionEntityState prev,RemoveSolutionUpvoteSuccessAction action)
  => prev.removeUpvote(action.solutionId,action.voteId);
SolutionEntityState addNewSolutionUpvoteReducer(SolutionEntityState prev,AddNewSolutionUpvoteAction action)
  => prev.addNewUpvote(action.solutionId,action.voteId);

SolutionEntityState getNextPageDownvotesReducer(SolutionEntityState prev,GetNextPageSolutionDownvotesAction action)
  => prev.starLoadingNextDownvotes(action.solutionId);
SolutionEntityState addNextPageDownvotesReducer(SolutionEntityState prev,AddNextPageSolutionDownvotesAction action)
  => prev.addNextPageDownvotes(action.solutionId, action.voteIds);
SolutionEntityState makeDownvoteReducer(SolutionEntityState prev,MakeSolutionDownvoteSuccessAction action)
  => prev.makeDownvote(action.solutionId,action.upvoteId,action.downvoteId);
SolutionEntityState removeDownVoteAction(SolutionEntityState prev,RemoveSolutionDownvoteSuccessAction action)
  => prev.removeDownvote(action.solutionId,action.voteId);
SolutionEntityState addNewSolutionDownvoteReducer(SolutionEntityState prev,AddNewSolutionDownvoteAction action)
  => prev.addNewDownvote(action.solutionId,action.voteId);

SolutionEntityState getNextPageCommentsReducer(SolutionEntityState prev,GetNextPageSolutionCommentsAction action)
  => prev.getNextPageComments(action.solutionId);
SolutionEntityState addNextPageCommentsReducer(SolutionEntityState prev,AddNextPageSolutionCommentsAction action)
  => prev.addNextPageComments(action.solutionId,action.commentsIds);
SolutionEntityState addCommentReducer(SolutionEntityState prev,AddSolutionCommentAction action)
  => prev.addComment(action.solutionId,action.commentId);
SolutionEntityState removeCommentReducer(SolutionEntityState prev,RemoveSolutionCommentAction action)
  => prev.removeComment(action.solutionId,action.commentId);
SolutionEntityState addNewCommentReducer(SolutionEntityState prev,AddNewSolutionCommentAction action)
  => prev.addNewComment(action.solutionId,action.commentId);

SolutionEntityState startLoadingImageReducer(SolutionEntityState prev,LoadSolutionImageAction action)
  => prev.startLoadingImage(action.solutionId, action.index);
SolutionEntityState loadImageReducer(SolutionEntityState prev,LoadSolutionImageSuccessAction action)
  => prev.loadImage(action.solutionId, action.index, action.image);

SolutionEntityState markAsCorrectReducer(SolutionEntityState prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.markAsCorrect(action.solutionId);
SolutionEntityState markAsIncorrectReducer(SolutionEntityState prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.markAsIncorrect(action.solutionId);

Reducer<SolutionEntityState> solutionEntityStateReducers = combineReducers<SolutionEntityState>([
  TypedReducer<SolutionEntityState,AddSolutionAction>(addSolutionReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionsAction>(addSolutionsReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionSuccessAction>(removeSolutionReducer).call,

  TypedReducer<SolutionEntityState,GetNextPageSolutionUpvotesAction>(getNextPageUpvotesReducer).call,
  TypedReducer<SolutionEntityState,AddNextPageSolutionUpvatesAction>(addNextPageUpvotesReducer).call,
  TypedReducer<SolutionEntityState,MakeSolutionUpvoteSuccessAction>(makeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionUpvoteSuccessAction>(removeUpvoteReducer).call,
  TypedReducer<SolutionEntityState,AddNewSolutionUpvoteAction>(addNewSolutionUpvoteReducer).call,

  TypedReducer<SolutionEntityState,GetNextPageSolutionDownvotesAction>(getNextPageDownvotesReducer).call,
  TypedReducer<SolutionEntityState,AddNextPageSolutionDownvotesAction>(addNextPageDownvotesReducer).call,
  TypedReducer<SolutionEntityState,MakeSolutionDownvoteSuccessAction>(makeDownvoteReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionDownvoteSuccessAction>(removeDownVoteAction).call,
  TypedReducer<SolutionEntityState,AddNewSolutionDownvoteAction>(addNewSolutionDownvoteReducer).call,

  TypedReducer<SolutionEntityState,GetNextPageSolutionCommentsAction>(getNextPageCommentsReducer).call,
  TypedReducer<SolutionEntityState,AddNextPageSolutionCommentsAction>(addNextPageCommentsReducer).call,
  TypedReducer<SolutionEntityState,AddSolutionCommentAction>(addCommentReducer).call,
  TypedReducer<SolutionEntityState,RemoveSolutionCommentAction>(removeCommentReducer).call,
  TypedReducer<SolutionEntityState,AddNewSolutionCommentAction>(addNewCommentReducer).call,

  TypedReducer<SolutionEntityState,LoadSolutionImageAction>(startLoadingImageReducer).call,
  TypedReducer<SolutionEntityState,LoadSolutionImageSuccessAction>(loadImageReducer).call,

  TypedReducer<SolutionEntityState,MarkSolutionAsCorrectSuccessAction>(markAsCorrectReducer).call,
  TypedReducer<SolutionEntityState,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectReducer).call,
]);