import 'package:my_social_app/services/solution_user_vote_service.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

//solutoin votes;
void makeSolutionUpvoteMiddleware(Store<AppState> store, action,NextDispatcher next){
  if(action is MakeSolutionUpvoteAction){
    final user = store.state.currentUser!;
    SolutionUserVoteService()
      .makeUpvote(action.solutionId)
      .then((response) => store.dispatch(MakeSolutionUpvoteSuccessAction(
        solutionId: action.solutionId,
        solutionUserVoteState: SolutionUserVoteState(
          id: response.id,
          userId: user.id,
          userName: user.userName,
          name: user.name,
          image: user.image
        ) 
      )));
  }
  next(action);
}
void removeSolutionUpvoteMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RemoveSolutionUpvoteAction){
    final userId = store.state.login.login!.id;
    SolutionUserVoteService()
      .removeUpvote(action.solutionId)
      .then((_) => store.dispatch(RemoveSolutionUpvoteSuccessAction(solutionId: action.solutionId, userId: userId)));
  }
  next(action);
}
void makeSolutionDownvoteMiddleware(Store<AppState> store, action,NextDispatcher next){
  if(action is MakeSolutionDownvoteAction){
    final user = store.state.currentUser!;
    SolutionUserVoteService()
      .makeDownvote(action.solutionId)
      .then((response) => store.dispatch(MakeSolutionDownvoteSuccessAction(
        solutionId: action.solutionId,
        solutionUserVote: SolutionUserVoteState(
          id: response.id,
          userId: user.id,
          userName: user.userName,
          name: user.name,
          image: user.image
        )
      )));
  }
  next(action);
}
void removeSolutionDownvoteMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RemoveSolutionDownvoteAction){
    final userId = store.state.login.login!.id;
    SolutionUserVoteService()
      .removeDownvote(action.solutionId)
      .then((_) => store.dispatch(RemoveSolutionDownvoteSuccessAction(solutionId: action.solutionId, userId: userId)));
  }
  next(action);
}
void nextSolutionUpvotesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSolutionUpvotesAction){
    final pagination = store.state.solutionEntityState.getValue(action.solutionId)!.upvotes;
    SolutionUserVoteService()
      .getUpvotes(action.solutionId, pagination.next)
      .then((votes) => store.dispatch(NextSolutionUpvotesSuccessAction(solutionId: action.solutionId, votes: votes.map((e) => e.toSolutionUserVoteState()))))
      .catchError((e){
        store.dispatch(NextSolutionUpvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void nextSolutionDownvotesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSolutionDownvotesAction){
    final pagination = store.state.solutionEntityState.getValue(action.solutionId)!.downvotes;
    SolutionUserVoteService()
      .getDownvotes(action.solutionId, pagination.next)
      .then((votes) => store.dispatch(NextSolutionDownvotesSuccessAction(solutionId: action.solutionId, votes: votes.map((e) => e.toSolutionUserVoteState()))))
      .catchError((e){
        store.dispatch(NextSolutionDownvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
//solution votes;
