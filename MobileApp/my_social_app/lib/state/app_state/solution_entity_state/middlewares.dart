import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionAction){
    if(store.state.solutionEntityState.entities[action.solutionId] == null){
      SolutionService()
        .getSolutionById(action.solutionId)
        .then((solution){
          store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(solution.appUserId)));
        });
    }
  }
  next(action);
}
void loadSolutionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionImageAction){
    final image = store.state.solutionEntityState.entities[action.solutionId]!.images.elementAt(action.index);
    if(image.state == ImageStatus.notStarted){
      SolutionService()
        .getSolutionImage(action.solutionId,image.id)
        .then((image) => store.dispatch(
          LoadSolutionImageSuccessAction(solutionId: action.solutionId,index: action.index,image: image)
        ));
    }
  }
  next(action);
}

void removeSolutionDispathcer(Store<AppState> store,SolutionState solution){
  final question = store.state.questionEntityState.entities[solution.questionId];
  if(question != null){
    store.dispatch(RemoveQuestionSolutionAction(solution: solution));
    if(solution.state == SolutionStatus.correct && question.numberOfCorrectSolutions <= 1){
      store.dispatch(MarkUserQuestionAsUnsolvedAction(userId: question.appUserId, questionId: solution.questionId));
    }
  }
  store.dispatch(RemoveSolutionSuccessAction(solutionId: solution.id));
}
void removeSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveSolutionAction){
    SolutionService()
      .delete(action.solution.id)
      .then((_){
        final question = store.state.questionEntityState.entities[action.solution.questionId];
        if(question != null){
          store.dispatch(RemoveQuestionSolutionAction(solution: action.solution));
          if(action.solution.state == SolutionStatus.correct && question.numberOfCorrectSolutions <= 1){
            store.dispatch(MarkUserQuestionAsUnsolvedAction(userId: question.appUserId, questionId: action.solution.questionId));
          }
        }
        store.dispatch(RemoveSolutionSuccessAction(solutionId: action.solution.id));
      });
  }
  next(action);
}

void getNextPageSolutionUpvotesIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionUpvotesIfNoPageAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.upvotes;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageSolutionUpvotesAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionUpvotesIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionUpvotesIfReadyAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.upvotes;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageSolutionUpvotesAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionUpvotesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionUpvotesAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.upvotes;
    SolutionService()
      .getSolutionUpvotes(action.solutionId, pagination.next)
      .then((votes){
        store.dispatch(AddSolutionUserVotesAction(votes: votes.map((e) => e.toSolutionUserVoteState())));
        store.dispatch(AddUsersAction(users: votes.map((e) => e.appUser!.toUserState())));
        store.dispatch(AddUserImagesAction(images: votes.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddNextPageSolutionUpvatesAction(solutionId: action.solutionId, voteIds: votes.map((e) => e.id)));
      });
  }
  next(action);
}
void makeSolutionUpvoteMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MakeSolutionUpvoteAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .makeUpvote(action.solutionId)
      .then((upvote){
        final downvoteId = store.state.solutionUserVoteEntityState.select(action.solutionId,accountId)?.id ?? 0;
        store.dispatch(RemoveSolutionUserVoteAction(voteId: downvoteId));
        store.dispatch(AddSolutionUserVoteAction(vote: upvote.toSolutionUserVoteState()));
        store.dispatch(MakeSolutionUpvoteSuccessAction(solutionId: action.solutionId,upvoteId: upvote.id,downvoteId: downvoteId));
      });
  }
  next(action);
}
void removeSolutionUpvoteMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is RemoveSolutionUpvoteAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .removeUpvote(action.solutionId)
      .then((_){
        final voteId = store.state.solutionUserVoteEntityState.select(action.solutionId, accountId)?.id ?? -1;
        store.dispatch(RemoveSolutionUpvoteSuccessAction(solutionId: action.solutionId,voteId: voteId));
        store.dispatch(RemoveSolutionUserVoteAction(voteId: voteId));
      });
  }
  next(action);
}

void getNextSolutionPageDownvotesIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionDownvotesIfNoPageAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.downvotes;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageSolutionDownvotesAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionDownvotesIfReady(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionDownvotesIfReadyAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.downvotes;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageSolutionDownvotesAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageDownvotesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionDownvotesAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.downvotes;
    SolutionService()
      .getSolutionDownvotes(action.solutionId, pagination.next)
      .then((votes){
        store.dispatch(AddSolutionUserVotesAction(votes: votes.map((e) => e.toSolutionUserVoteState())));
        store.dispatch(AddUsersAction(users: votes.map((e) => e.appUser!.toUserState())));
        store.dispatch(AddUserImagesAction(images: votes.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddNextPageSolutionDownvotesAction(solutionId: action.solutionId, voteIds: votes.map((e) => e.id)));
      });
  }
  next(action);
}
void makeSolutionDownvoteMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MakeSolutionDownvoteAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .makeDownvote(action.solutionId)
      .then((downvote){
        final upvoteId = store.state.solutionUserVoteEntityState.select(action.solutionId,accountId)?.id ?? 0;
        store.dispatch(RemoveSolutionUserVoteAction(voteId: upvoteId));
        store.dispatch(AddSolutionUserVoteAction(vote: downvote.toSolutionUserVoteState()));
        store.dispatch(MakeSolutionDownvoteSuccessAction(solutionId: action.solutionId,upvoteId: upvoteId,downvoteId: downvote.id));
      });
  }
  next(action);
}
void removeSolutionDownvoteMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is RemoveSolutionDownvoteAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .removeDownvote(action.solutionId)
      .then((_){
        final voteId = store.state.solutionUserVoteEntityState.select(action.solutionId, accountId)?.id ?? 0;
        store.dispatch(RemoveSolutionDownvoteSuccessAction(solutionId: action.solutionId, voteId: voteId));
        store.dispatch(RemoveSolutionUserVoteAction(voteId: voteId));
      });
  }
  next(action);
}

void getNextPageSolutionCommentsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsIfNoPageAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.isReadyForNextPage && !comments.hasAtLeastOnePage){
      store.dispatch(GetNextPageSolutionCommentsAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionCommentsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsIfReadyAction){
    final comments = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    if(comments.isReadyForNextPage){
      store.dispatch(GetNextPageSolutionCommentsAction(solutionId: action.solutionId));
    }
  }
  next(action);
}
void getNextPageSolutionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSolutionCommentsAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    CommentService()
      .getBySolutionId(action.solutionId,pagination.next)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(commentsPerPage))));
        store.dispatch(AddNextPageSolutionCommentsAction(solutionId: action.solutionId,commentsIds: comments.map((e) => e.id)));
      });
  }
  next(action);
}

void markSolutionAsCorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsCorrectAction){
    final currentUserId = store.state.accountState!.id;
    SolutionService()
      .markAsCorrect(action.solutionId)
      .then((_){
        store.dispatch(MarkSolutionAsCorrectSuccessAction(solutionId: action.solutionId));
        store.dispatch(MarkQuestionSolutionAsCorrectAction(questionId: action.questionId, solutionId: action.solutionId));
        store.dispatch(MarkUserQuestionAsSolvedAction(userId: currentUserId, questionId: action.questionId));
      });
  }
  next(action);
}
void markSolutionAsIncorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsIncorrectAction){
    SolutionService()
      .markAsIncorrect(action.solutionId)
      .then((_){
        store.dispatch(MarkSolutionAsIncorrectSuccessAction(solutionId: action.solutionId));
        store.dispatch(MarkQuestionSolutionAsIncorrectAction(questionId: action.questionId, solutionId: action.solutionId));
      });
  }
  next(action);
}