import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:redux/redux.dart';

QuestionEntityState loadQuestionsReducer(QuestionEntityState oldState,Action action)
  => action is LoadQuestionsSuccessAction ? oldState.loadQuestions(action.questions) : oldState;

QuestionEntityState loadQuestionImageReducer(QuestionEntityState oldState, Action action)
  => action is LoadQuestionImageAction ? oldState.startLoadingImage(action.questionId, action.index) : oldState;

QuestionEntityState loadQuestionImageSuccessReducer(QuestionEntityState oldState, Action action)
  => action is LoadQuestionImageSuccessAction ? oldState.loadImage(action.questionId, action.index,action.image) : oldState;

QuestionEntityState createQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is CreateQuestionSucessAction ? oldState.addQuestion(action.payload) : oldState;

QuestionEntityState likeQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is LikeQuestionSuccessAction ? oldState.like(action.questionId) : oldState;

QuestionEntityState dislikeQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is DislikeQuestionSuccessAction ? oldState.dislike(action.questionId) : oldState;

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,LoadQuestionsSuccessAction>(loadQuestionsReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageAction>(loadQuestionImageReducer).call,
  TypedReducer<QuestionEntityState,LoadQuestionImageSuccessAction>(loadQuestionImageSuccessReducer).call,
  TypedReducer<QuestionEntityState,CreateQuestionSucessAction>(createQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
]);
