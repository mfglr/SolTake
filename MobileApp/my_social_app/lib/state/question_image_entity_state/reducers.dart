import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_entity_state.dart';
import 'package:redux/redux.dart';

QuestionImageEntityState addQuestionImageReducer(QuestionImageEntityState prev,Action action)
  => action is AddQuestionImageAction ? prev.addValue(action.value) : prev;

QuestionImageEntityState addQuestionImagesReducer(QuestionImageEntityState prev,Action action)
  => action is AddQuestionImagesAction ? prev.addValues(action.values) : prev;

QuestionImageEntityState addQuestionImagesListReducer(QuestionImageEntityState prev,Action action)
  => action is AddQuestionImagesListAction ? prev.addLists(action.lists) : prev;

QuestionImageEntityState loadQuestionImageReducer(QuestionImageEntityState prev,Action action)
  => action is LoadQuestionImageAction ? prev.startLoading(action.id) : prev;

QuestionImageEntityState loadQuestionImageSuccessReducer(QuestionImageEntityState prev,Action action)
  => action is LoadQuestionImageSuccessAction ? prev.loadImage(action.id, action.image) : prev;

Reducer<QuestionImageEntityState> questionImageEntityReducers = combineReducers<QuestionImageEntityState>([
  TypedReducer<QuestionImageEntityState,AddQuestionImageAction>(addQuestionImageReducer).call,
  TypedReducer<QuestionImageEntityState,AddQuestionImagesAction>(addQuestionImagesReducer).call,
  TypedReducer<QuestionImageEntityState,AddQuestionImagesListAction>(addQuestionImagesListReducer).call,
  TypedReducer<QuestionImageEntityState,LoadQuestionImageAction>(loadQuestionImageReducer).call,
  TypedReducer<QuestionImageEntityState,LoadQuestionImageSuccessAction>(loadQuestionImageSuccessReducer).call,
]);