import 'package:my_social_app/state/app_state/question_user_save_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_entity_state.dart';
import 'package:redux/redux.dart';

QuestionUserSaveEntityState addSavesReducer(QuestionUserSaveEntityState prev,AddQuestionUserSavesAction action)
  => prev.addSaves(action.saves);
QuestionUserSaveEntityState addSaveReducer(QuestionUserSaveEntityState prev, AddQuestionUserSaveAction action)
  => prev.addSave(action.save);
QuestionUserSaveEntityState removeSaveReducer(QuestionUserSaveEntityState prev, RemoveQuestionUserSaveAction action)
  => prev.removeSave(action.saveId);

Reducer<QuestionUserSaveEntityState> questionUserSaveEntityReducers = combineReducers<QuestionUserSaveEntityState>([
  TypedReducer<QuestionUserSaveEntityState,AddQuestionUserSavesAction>(addSavesReducer).call,
  TypedReducer<QuestionUserSaveEntityState,AddQuestionUserSaveAction>(addSaveReducer).call,
  TypedReducer<QuestionUserSaveEntityState,RemoveQuestionUserSaveAction>(removeSaveReducer).call,
]);