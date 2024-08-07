import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_entity_state.dart';
import 'package:redux/redux.dart';

QuestionImageEntityState addQuestionImageReducer(QuestionImageEntityState prev,AddQuestionImageAction action)
  => prev.addValue(action.value);
QuestionImageEntityState addQuestionImagesReducer(QuestionImageEntityState prev,AddQuestionImagesAction action)
  => prev.addValues(action.values);
QuestionImageEntityState addQuestionImagesListReducer(QuestionImageEntityState prev,AddQuestionImagesListAction action)
  => prev.addLists(action.lists);
QuestionImageEntityState loadQuestionImageReducer(QuestionImageEntityState prev,LoadQuestionImageAction action)
  => prev.startLoadingImage(action.id);
QuestionImageEntityState loadQuestionImageSuccessReducer(QuestionImageEntityState prev,LoadQuestionImageSuccessAction action)
  => prev.loadImage(action.id, action.image);
QuestionImageEntityState questionImageNotFoundReducer(QuestionImageEntityState prev,QuestionImageNotFoundAction action)
  => prev.notFoundImage(action.questionImageId);

Reducer<QuestionImageEntityState> questionImageEntityReducers = combineReducers<QuestionImageEntityState>([
  TypedReducer<QuestionImageEntityState,AddQuestionImageAction>(addQuestionImageReducer).call,
  TypedReducer<QuestionImageEntityState,AddQuestionImagesAction>(addQuestionImagesReducer).call,
  TypedReducer<QuestionImageEntityState,AddQuestionImagesListAction>(addQuestionImagesListReducer).call,
  TypedReducer<QuestionImageEntityState,LoadQuestionImageAction>(loadQuestionImageReducer).call,
  TypedReducer<QuestionImageEntityState,LoadQuestionImageSuccessAction>(loadQuestionImageSuccessReducer).call,
  TypedReducer<QuestionImageEntityState,QuestionImageNotFoundAction>(questionImageNotFoundReducer).call,
]);