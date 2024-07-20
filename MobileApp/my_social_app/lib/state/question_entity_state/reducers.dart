import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:redux/redux.dart';

QuestionEntityState addQuestionReducer(QuestionEntityState prev,Action action)
  => action is AddQuestionAction ? prev.addQuestion(action.value) : prev;

QuestionEntityState addQuestionsReducer(QuestionEntityState oldState,Action action)
  => action is AddQuestionsAction ? oldState.addQuestions(action.questions) : oldState;

QuestionEntityState likeQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is LikeQuestionSuccessAction ? oldState.like(action.questionId) : oldState;

QuestionEntityState dislikeQuestionSuccessReducer(QuestionEntityState oldState, Action action)
  => action is DislikeQuestionSuccessAction ? oldState.dislike(action.questionId) : oldState;

Reducer<QuestionEntityState> questionsReducer = combineReducers<QuestionEntityState>([
  TypedReducer<QuestionEntityState,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<QuestionEntityState,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<QuestionEntityState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionEntityState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
]);
