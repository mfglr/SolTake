import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

//solutions
void loadSolutionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadSolutionAction){
    SolutionService()
      .getSolutionById(action.solutionId)
      .then((solution) => store.dispatch(LoadSolutionSuccessAction(solution: solution.toSolutionState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(SolutionNotFoundAction(solutionId: action.solutionId));
          }
          else{
            store.dispatch(LoadSolutionFailedAction(solutionId: action.solutionId));
          }
        }
        throw e;
      });
  }
  next(action);
}
void uploadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UploadSolutionAction){
    SolutionService()
      .create(
        action.solution.questionId,
        action.solution.content,
        action.solution.medias as Iterable<LocalMedia>,
        (rate){
          store.dispatch(ChangeSolutionRateAction(rate: rate, solution: action.solution));
          if(rate == 1){
            store.dispatch(MarkSolutionAsProcessingAction(solution: action.solution));
          }
        }
      )
      .then((response){
        store.dispatch(UploadSolutionSuccessAction(
          solution: action.solution,
          serverId: response.id
        ));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(UploadSolutionFailedAction(solution: action.solution));
        throw e;
      });
  }
  next(action);
}
void reuploadSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is ReuploadSolutionAction){
    SolutionService()
      .create(
        action.solution.questionId,
        action.solution.content,
        action.solution.medias as Iterable<LocalMedia>,
        (rate){
          store.dispatch(ChangeSolutionRateAction(rate: rate, solution: action.solution));
          if(rate == 1){
            store.dispatch(MarkSolutionAsProcessingAction(solution: action.solution));
          }
        }
      )
      .then((response){
        store.dispatch(UploadSolutionSuccessAction(
          solution: action.solution,
          serverId: response.id
        ));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(UploadSolutionFailedAction(solution: action.solution));
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
        // store.dispatch(UploadSolutionSuccessAction(solution: solution.toSolutionState()));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void deleteSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteSolutionAction){
    SolutionService()
      .delete(action.solution.id)
      .then((_) => store.dispatch(DeleteSolutionSuccessAction(
        solution: action.solution,
      )));
  }
  next(action);
}
void markSolutionAsCorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsCorrectAction){
    SolutionService()
      .markAsCorrect(action.solution.id)
      .then((_) => store.dispatch(MarkSolutionAsCorrectSuccessAction(
        solution: action.solution
      )));
  }
  next(action);
}
void markSolutionAsIncorrectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkSolutionAsIncorrectAction){
    SolutionService()
      .markAsIncorrect(action.solution.id)
      .then((_) => store.dispatch(MarkSolutionAsIncorrectSuccessAction(
        solution: action.solution
      )));
  }
  next(action);
}
//solutions

//question solutions
void nextQuestionSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionSolutionsAction){
    SolutionService()
      .getSolutionsByQuestionId(action.questionId, selectQuestionSolutions(store, action.questionId).next)
      .then((solutions) => store.dispatch(NextQuestionSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionSolutionsAction){
    SolutionService()
      .getSolutionsByQuestionId(action.questionId, selectQuestionSolutions(store, action.questionId).first)
      .then((solutions) => store.dispatch(RefreshQuestionSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question solutions

//question correct solutions
void nextQuestionCorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionCorrectSolutionsAction){
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, selectQuestionCorrectSolutions(store, action.questionId).next)
      .then((solutions) => store.dispatch(NextQuestionCorrectSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionCorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionCorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionCorrectSolutionsAction){
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, selectQuestionCorrectSolutions(store, action.questionId).first)
      .then((solutions) => store.dispatch(RefreshQuestionCorrectSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionCorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question correct solutions

//question pending solutions
void nextQuestionPendingSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionPendingSolutionsAction){
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutions(store, action.questionId).next)
      .then((solutions) => store.dispatch(NextQuestionPendingSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionPendingSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionPendingSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionPendingSolutionsAction){
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutions(store, action.questionId).first)
      .then((solutions) => store.dispatch(RefreshQuestionPendingSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionPendingSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question pending solutions

//question incorrect solutions
void nextQuestionIncorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionIncorrectSolutionsAction){
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, selectQuestionIncorrectSolutions(store, action.questionId).next)
      .then((solutions) => store.dispatch(NextQuestionIncorrectSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionIncorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionIncorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionIncorrectSolutionsAction){
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, selectQuestionIncorrectSolutions(store, action.questionId).first)
      .then((solutions) => store.dispatch(RefreshQuestionIncorrectSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionIncorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question incorrect solutions

//question video solutions
void nextQuestionVideoSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionVideoSolutionsAction){
    SolutionService()
      .getVideoSolutions(action.questionId, selectQuestionVideoSolutions(store, action.questionId).next)
      .then((solutions) => store.dispatch(NextQuestionVideoSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionVideoSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionVideoSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionVideoSolutionsAction){
    SolutionService()
      .getVideoSolutions(action.questionId, selectQuestionVideoSolutions(store, action.questionId).first)
      .then((solutions) => store.dispatch(RefreshQuestionVideoSolutionsSuccessAction(
        questionId: action.questionId,
        solutions: solutions.map((solution) => solution.toSolutionState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionVideoSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question video solutions
