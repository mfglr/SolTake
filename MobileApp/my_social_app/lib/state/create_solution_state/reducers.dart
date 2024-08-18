import 'package:my_social_app/state/create_solution_state/actions.dart';
import 'package:my_social_app/state/create_solution_state/create_solution_state.dart';
import 'package:redux/redux.dart';

CreateSolutionState changeQuestionIdReducer(CreateSolutionState prev,ChangeQuestionIdAction action)
  => prev.changeQuestionId(action.questionId);
CreateSolutionState changeContentReducer(CreateSolutionState prev,ChangeSolutionContentAction action)
  => prev.changeContent(action.content);
CreateSolutionState addImageReducer(CreateSolutionState prev,CreateSolutionImageAction action)
  => prev.addImage(action.image);
CreateSolutionState removeImageReducer(CreateSolutionState prev,RemoveSolutoionImageAction action)
  => prev.removeImage(action.image);
CreateSolutionState clearStateReducer(CreateSolutionState prev,ClearCreateSolutionStateAction action)
  => prev.clear();

Reducer<CreateSolutionState> createrSolutionReducers = combineReducers<CreateSolutionState>([
  TypedReducer<CreateSolutionState,ChangeQuestionIdAction>(changeQuestionIdReducer).call,
  TypedReducer<CreateSolutionState,ChangeSolutionContentAction>(changeContentReducer).call,
  TypedReducer<CreateSolutionState,CreateSolutionImageAction>(addImageReducer).call,
  TypedReducer<CreateSolutionState,RemoveSolutoionImageAction>(removeImageReducer).call,
  TypedReducer<CreateSolutionState,ClearCreateSolutionStateAction>(clearStateReducer).call,
]);