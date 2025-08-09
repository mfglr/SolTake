import 'package:my_social_app/services/solution_user_vote_service.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/selectors.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/selectors.dart';
import 'package:redux/redux.dart';

void makeSolutionUpvoteMiddleware(Store<AppState> store, action,NextDispatcher next){
  if(action is MakeSolutionUpvoteAction){
    final user = store.state.users.usersById[store.state.login.login!.id].entity!;
    SolutionUserVoteService()
      .makeUpvote(action.solution.id)
      .then((response) => store.dispatch(MakeSolutionUpvoteSuccessAction(
        solution: action.solution,
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
void removeSolutionUpvoteMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RemoveSolutionUpvoteAction){
    final userId = store.state.login.login!.id;
    SolutionUserVoteService()
      .removeUpvote(action.solution.id)
      .then((_) => store.dispatch(RemoveSolutionUpvoteSuccessAction(solution: action.solution, userId: userId)));
  }
  next(action);
}
void nextSolutionUpvotesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSolutionUpvotesAction){
    SolutionUserVoteService()
      .getUpvotes(action.solutionId, selectSolutionUpvotes(store, action.solutionId).next)
      .then((votes) => store.dispatch(NextSolutionUpvotesSuccessAction(
        solutionId: action.solutionId,
        votes: votes.map((e) => e.toSolutionUserVoteState())
      )))
      .catchError((e){
        store.dispatch(NextSolutionUpvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void refreshSolutionUpvotesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSolutionUpvotesAction){
    SolutionUserVoteService()
      .getUpvotes(action.solutionId, selectSolutionUpvotes(store, action.solutionId).first)
      .then((votes) => store.dispatch(RefreshSolutionUpvotesSuccessAction(
        solutionId: action.solutionId,
        votes: votes.map((e) => e.toSolutionUserVoteState())
      )))
      .catchError((e){
        store.dispatch(RefreshSolutionUpvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}

void makeSolutionDownvoteMiddleware(Store<AppState> store, action,NextDispatcher next){
  if(action is MakeSolutionDownvoteAction){
    final user = selectUserById(store, store.state.login.login!.id).entity!;
    SolutionUserVoteService()
      .makeDownvote(action.solution.id)
      .then((response) => store.dispatch(MakeSolutionDownvoteSuccessAction(
        solution: action.solution,
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
      .removeDownvote(action.solution.id)
      .then((_) => store.dispatch(RemoveSolutionDownvoteSuccessAction(
        solution: action.solution,
        userId: userId
      )));
  }
  next(action);
}
void nextSolutionDownvotesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSolutionDownvotesAction){
    SolutionUserVoteService()
      .getDownvotes(action.solutionId, selectSolutionDownvotes(store, action.solutionId).next)
      .then((votes) => store.dispatch(NextSolutionDownvotesSuccessAction(
        solutionId: action.solutionId,
        votes: votes.map((e) => e.toSolutionUserVoteState())
      )))
      .catchError((e){
        store.dispatch(NextSolutionDownvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void refreshSolutionDownvotesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSolutionDownvotesAction){
    SolutionUserVoteService()
      .getDownvotes(action.solutionId, selectSolutionDownvotes(store, action.solutionId).first)
      .then((votes) => store.dispatch(RefreshSolutionDownvotesSuccessAction(
        solutionId: action.solutionId,
        votes: votes.map((e) => e.toSolutionUserVoteState())
      )))
      .catchError((e){
        store.dispatch(RefreshSolutionDownvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
