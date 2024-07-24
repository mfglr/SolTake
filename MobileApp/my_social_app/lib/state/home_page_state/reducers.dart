import 'package:my_social_app/state/home_page_state/actions.dart';
import 'package:my_social_app/state/home_page_state/home_page_state.dart';
import 'package:redux/redux.dart';

HomePageState nextPageOfQuestionsReducer(HomePageState prev,NextPageOfHomeQuestionsSuccessAction action)
  => prev.nextPageOfQuestions(action.questionIds);

HomePageState addHomeQuestionReducer(HomePageState prev,AddHomeQuestionAction action)
  => prev.addQuestion(action.questionId);

Reducer<HomePageState> homePageReducers = combineReducers<HomePageState>([
  TypedReducer<HomePageState,NextPageOfHomeQuestionsSuccessAction>(nextPageOfQuestionsReducer).call,
  TypedReducer<HomePageState,AddHomeQuestionAction>(addHomeQuestionReducer).call,
]);