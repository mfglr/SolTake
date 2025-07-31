import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

//questions
EntityState<int,QuestionState> addQuestionReducer(EntityState<int,QuestionState> prev,AddQuestionAction action)
  => prev.appendOne(action.value);
EntityState<int,QuestionState> addQuestionsReducer(EntityState<int,QuestionState> prev,AddQuestionsAction action)
  => prev.appendMany(action.questions);



Reducer<EntityState<int,QuestionState>> questionsReducer = combineReducers<EntityState<int,QuestionState>>([
  TypedReducer<EntityState<int,QuestionState>,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionsAction>(addQuestionsReducer).call,
]);
