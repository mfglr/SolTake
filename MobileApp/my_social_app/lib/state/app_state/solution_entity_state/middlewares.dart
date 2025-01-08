import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
    
    ToastCreator.displaySuccess(solutionCreationStartedNotification[getLanguageCode(store)]!);
    if(action.medias.isNotEmpty){
      store.dispatch(ChangeUploadStateAction(state: UploadSolutionState(action)));
    }
    
    SolutionService()
      .create(
        action.questionId,
        action.content,
        action.medias,
        (rate) => store.dispatch(ChangeUploadRateAction(id: action.id, rate: rate))
      )
      .then((solution){
        final solutionState = solution.toSolutionState();
        store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
        store.dispatch(CreateNewQuestionSolutionAction(solution: solutionState));
        store.dispatch(RemoveUploadStateAction(id: action.id));
        
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageCode(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(id: action.id,status: UploadStatus.failed));
        throw e;
      });
  }
  next(action);
}

void loadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionAction){
    if(store.state.solutionEntityState.entities[action.solutionId] == null){
      SolutionService()
        .getSolutionById(action.solutionId)
        .then((solution){
          store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
        });
    }
  }
  next(action);
}

void removeSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveSolutionAction){
    final question = store.state.questionEntityState.entities[action.solution.questionId];
    SolutionService()
      .delete(action.solution.id)
      .then((_){
        if(question != null){
          store.dispatch(RemoveQuestionSolutionAction(solution: action.solution));
          if(action.solution.state == SolutionStatus.correct && question.numberOfCorrectSolutions <= 1){
            store.dispatch(MarkUserQuestionAsUnsolvedAction(userId: question.userId, questionId: action.solution.questionId));
          }
        }
        store.dispatch(RemoveSolutionSuccessAction(solutionId: action.solution.id));
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
void saveSolutionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is SaveSolutionAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .saveSolution(action.solutionId)
      .then((save){
        store.dispatch(AddUserSavedSolutionAction(userId: accountId, saveId: save.id));
        store.dispatch(AddSolutionUserSaveAction(save: save.toSolutionUserSaveState()));
        store.dispatch(SaveSolutionSuccessAction(solutionId: action.solutionId));
      });
  }
  next(action);
}
void unsaveSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnsaveSolutionAction){
    final accountId = store.state.accountState!.id;
    SolutionService()
      .unsaveSolution(action.solutionId)
      .then((save){
        final saveId = store.state.solutionUserSaveEntityState.select(action.solutionId, accountId)?.id ?? 0;
        store.dispatch(RemoveSolutionUserSaveAction(saveId: saveId));
        store.dispatch(RemoveUserSavedSolutionAction(userId: accountId, saveId: saveId));
        store.dispatch(UnsaveSolutionSuccessAction(solutionId: action.solutionId));
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

void nextSolutionUpvotesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSolutionUpvotesAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.upvotes;
    SolutionService()
      .getSolutionUpvotes(action.solutionId, pagination.next)
      .then((votes){
        store.dispatch(AddSolutionUserVotesAction(votes: votes.map((e) => e.toSolutionUserVoteState())));
        store.dispatch(AddUsersAction(users: votes.map((e) => e.appUser!.toUserState())));
        store.dispatch(NextSolutionUpvotesSuccessAction(solutionId: action.solutionId, voteIds: votes.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextSolutionUpvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void nextSolutionDownvotesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSolutionDownvotesAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.downvotes;
    SolutionService()
      .getSolutionDownvotes(action.solutionId, pagination.next)
      .then((votes){
        store.dispatch(AddSolutionUserVotesAction(votes: votes.map((e) => e.toSolutionUserVoteState())));
        store.dispatch(AddUsersAction(users: votes.map((e) => e.appUser!.toUserState())));
        store.dispatch(NextSolutionDownvotesSuccessAction(solutionId: action.solutionId, voteIds: votes.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextSolutionDownvotesFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void nextSolutionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSolutionCommentsAction){
    final pagination = store.state.solutionEntityState.entities[action.solutionId]!.comments;
    CommentService()
      .getBySolutionId(action.solutionId,pagination.next)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(NextSolutionCommentsSuccessAction(solutionId: action.solutionId,commentsIds: comments.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextSolutionCommentsFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}

