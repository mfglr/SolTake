import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:redux/redux.dart';

QuestionEntityState loadQuestionsByUserIdReducer(QuestionEntityState oldState,Action action)
  => action is LoadQuestionsByUserIdSuccessAction ? oldState.loadQuestions(action.payload) : oldState;

QuestionEntityState loadQuestionImageReducer(QuestionEntityState oldState, Action action)
  => action is LoadQuestionImageAction ? oldState.startLoadingImage(action.questionId, action.index) : oldState;

QuestionEntityState loadQuestionImageSuccessReducer(QuestionEntityState oldState, Action action)
  => action is LoadQuestionImageSuccessAction ? oldState.loadImage(action.questionId, action.index,action.image) : oldState;

QuestionEntityState createQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is CreateQuestionSucessAction ? oldState.addQuestion(action.payload) : oldState;

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,LoadQuestionsByUserIdSuccessAction>(loadQuestionsByUserIdReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageAction>(loadQuestionImageReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageSuccessAction>(loadQuestionImageSuccessReducer).call,
  TypedReducer<QuestionEntityState,CreateQuestionSucessAction>(createQuestionSuccessReducer).call,
]);
