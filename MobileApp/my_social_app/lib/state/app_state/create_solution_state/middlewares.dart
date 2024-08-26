import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
    final state = store.state.createSolutionState;
    SolutionService()
      .createAsync(state.content, state.questionId!, state.images)
      .then((solution){
        final solutionState = solution.toSolutionState();
        store.dispatch(AddSolutionAction(solution: solution.toSolutionState()));
        store.dispatch(CreateNewQuestionSolutionAction(solution: solutionState));
        store.dispatch(const ClearCreateSolutionStateAction());
        ToastCreator.displaySuccess("Solution has been successfully created!");
      });
  }
  next(action);
}