import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//questions
EntityState<int,QuestionState> addQuestionReducer(EntityState<int,QuestionState> prev,AddQuestionAction action)
  => prev.appendOne(action.value);
EntityState<int,QuestionState> addQuestionsReducer(EntityState<int,QuestionState> prev,AddQuestionsAction action)
  => prev.appendMany(action.questions);

//solutions
EntityState<int,QuestionState> markSolutionAsCorrectReducer(EntityState<int,QuestionState> prev, MarkQuestionSolutionAsCorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsCorrect(action.solutionId));
EntityState<int,QuestionState> markSolutionAsIncorrectReducer(EntityState<int,QuestionState> prev,MarkQuestionSolutionAsIncorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsIncorrect(action.solutionId));



Reducer<EntityState<int,QuestionState>> questionsReducer = combineReducers<EntityState<int,QuestionState>>([
  TypedReducer<EntityState<int,QuestionState>,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionsAction>(addQuestionsReducer).call,

  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,
]);
