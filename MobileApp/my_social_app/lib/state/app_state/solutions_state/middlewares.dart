import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

//solutions
void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
    SolutionService()
      .create(
        action.questionId,
        action.content,
        action.medias,
        (rate) => store.dispatch(ChangeUploadRateAction(id: action.id, rate: rate))
      )
      .then((solution){
        store.dispatch(CreateSolutionSuccessAction(solution: solution.toSolutionState()));
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
        store.dispatch(CreateSolutionSuccessAction(solution: solution.toSolutionState()));
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
      .getSolutionsByQuestionId(action.questionId, selectQuestionSolutionsPagination(store, action.questionId).next)
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
      .getSolutionsByQuestionId(action.questionId, selectQuestionSolutionsPagination(store, action.questionId).first)
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
      .getCorrectSolutionsByQuestionId(action.questionId, selectQuestionCorrectSolutionsPagination(store, action.questionId).next)
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
      .getCorrectSolutionsByQuestionId(action.questionId, selectQuestionCorrectSolutionsPagination(store, action.questionId).first)
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
      .getPendingSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutionsPagination(store, action.questionId).next)
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
      .getPendingSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutionsPagination(store, action.questionId).first)
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
      .getIncorrectSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutionsPagination(store, action.questionId).next)
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
      .getIncorrectSolutionsByQuestionId(action.questionId, selectQuestionPendingSolutionsPagination(store, action.questionId).first)
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
      .getVideoSolutions(action.questionId, selectQuestionVideoSolutionsPagination(store, action.questionId).next)
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
      .getVideoSolutions(action.questionId, selectQuestionVideoSolutionsPagination(store, action.questionId).first)
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
