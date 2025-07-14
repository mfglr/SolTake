import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

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