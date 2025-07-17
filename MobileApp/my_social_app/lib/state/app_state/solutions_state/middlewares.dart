import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/services/solution_user_save_service.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
     if(action.medias.isNotEmpty){
      store.dispatch(ChangeUploadStateAction(state: UploadSolutionState(action)));
    }
    SolutionService()
      .create(
        action.question.id,
        action.content,
        action.medias,
        (rate) => store.dispatch(ChangeUploadRateAction(id: action.id, rate: rate))
      )
      .then((solution){
        store.dispatch(CreateSolutionSuccessAction(question: action.question, solution: solution.toSolutionState()));
        ToastCreator.displaySuccess(solutionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(id: action.id,status: UploadStatus.failed));
        throw e;
      });
  }
  next(action);
}
void deleteSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteSolutionAction){
    SolutionService()
      .delete(action.solution.id)
      .then((_) => store.dispatch(DeleteSolutionSuccessAction(
        question: action.question,
        solution: action.solution,
      )));
  }
  next(action);
}

//question solutions
void nextQuestionSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionSolutionsAction){
    final pagination = selectQuestionSolutions(store, action.questionId);
    SolutionService()
      .getSolutionsByQuestionId(action.questionId, pagination.next)
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
    final pagination = selectQuestionSolutions(store, action.questionId);
    SolutionService()
      .getSolutionsByQuestionId(action.questionId, pagination.first)
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
    final pagination = selectQuestionCorrectSolutions(store, action.questionId);
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, pagination.next)
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
    final pagination = selectQuestionCorrectSolutions(store, action.questionId);
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, pagination.first)
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
    final pagination = selectQuestionPendingSolutions(store, action.questionId);
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, pagination.next)
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
    final pagination = selectQuestionPendingSolutions(store, action.questionId);
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, pagination.first)
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
    final pagination = selectQuestionIncorrectSolutions(store, action.questionId);
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, pagination.next)
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
    final pagination = selectQuestionIncorrectSolutions(store, action.questionId);
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, pagination.first)
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
    final pagination = selectQuestionVideoSolutions(store, action.questionId);
    SolutionService()
      .getVideoSolutions(action.questionId, pagination.next)
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
    final pagination = selectQuestionVideoSolutions(store, action.questionId);
    SolutionService()
      .getVideoSolutions(action.questionId, pagination.first)
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

//saved solutions
// void nextSavedSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
//   if(action is NextSavedSolutionsAction){
//     final pagination = selectSavedSolutions(store);
//     SolutionUserSaveService()
//       .get(pagination.next)
//       .then((solutions) => store.dispatch(NextSavedSolutionsSuccessAction(
//         solutions: solutions.map((solution) => solution.toSolutionUserSaveState())
//       )))
//       .catchError((e){
//         store.dispatch(const NextSavedSolutionsFailedAction());
//         throw e;
//       });
//   }
//   next(action);
// }
// void refreshSavedSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
//   if(action is RefreshSavedSolutionsAction){
//     final pagination = selectSavedSolutions(store);
//     SolutionUserSaveService()
//       .get(pagination.first)
//       .then((solutions) => store.dispatch(RefreshSavedSolutionsSuccessAction(
//         solutions: solutions.map((solution) => solution.toSolutionUserSaveState())
//       )))
//       .catchError((e){
//         store.dispatch(const RefreshSavedSolutionsFailedAction());
//         throw e;
//       });
//   }
//   next(action);
// }

void saveSolutionMiddeleware(Store<AppState> store, action, NextDispatcher next){
  if(action is SaveSolutionAction){
    SolutionUserSaveService()
      .create(action.solution.id)
      .then((response) => store.dispatch(SaveSolutionSuccessAction(
        id: response.id,
        solution: action.solution
      )));
  }
  next(action);
}
void unsaveSolutionMiddeleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UnsaveSolutionAction){
    SolutionUserSaveService()
      .delete(action.solution.id)
      .then((response) => store.dispatch(UnsaveSolutionSuccessAction(
        solutionId: action.solution.id
      )));
  }
  next(action);
}
//saved solutions