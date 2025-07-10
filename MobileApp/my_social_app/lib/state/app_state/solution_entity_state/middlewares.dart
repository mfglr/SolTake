import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/services/solution_user_vote_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
    ToastCreator.displaySuccess(solutionCreationStartedNotification[getLanguageByStore(store)]!);
    
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
        store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
        store.dispatch(CreateNewQuestionSolutionAction(questionId: action.questionId, solutionId: solution.id,));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(id: action.id,status: UploadStatus.failed));
        throw e;
      });
  }
  next(action);
}

void createSolutionByAiMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionByAIAction){
    ToastCreator.displaySuccess(solutionCreationStartedNotification[getLanguageByStore(store)]!);
    SolutionService()
      .createByAI(action.modelId,action.questionId,action.blobName,action.position,action.prompt,action.isHighResulation)
      .then((solution){
        store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
        store.dispatch(CreateNewQuestionSolutionAction(questionId: action.questionId, solutionId: solution.id));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  
  next(action);
}

void loadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionAction){
    if(store.state.solutionEntityState.getValue(action.solutionId) == null){
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
    final question = store.state.questionEntityState.getValue(action.solution.questionId);
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
    final currentUserId = store.state.login.login!.id;
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
