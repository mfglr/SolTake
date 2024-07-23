import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/create_solution_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createSolutionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateSolutionAction){
    final state = store.state.createSolutionState;
    SolutionService()
      .createAsync(state.content, state.questionId!, state.images)
      .then((solution){
        store.dispatch(
          AddSolutionAction(
            solution: solution.toSolutionState()
          )
        );
        
        store.dispatch(
          AddQuestionSolutionAction(
            questionId: state.questionId!,
            solutionId: solution.id
          )
        );

        store.dispatch(
          AddSolutionImagesAction(
            images: solution.images.map((e) => e.toSolutionImageState())
          )
        );

        store.dispatch(const ClearCreateSolutionStateAction());

        ToastCreator.displaySuccess("Solution has been successfully created!");
      });
  }
  next(action);
}