import 'package:my_social_app/state/home_page_state/actions.dart';
import 'package:my_social_app/state/home_page_state/home_page_state.dart';
import 'package:redux/redux.dart';

HomePageState nextPageOfQuestionsReducer(HomePageState prev,NextPageOfHomeQuestionsSuccessAction action)
  => prev.nextPageOfQuestions(action.questionIds);

Reducer<HomePageState> homePageReducers = combineReducers<HomePageState>([
  TypedReducer<HomePageState,NextPageOfHomeQuestionsSuccessAction>(nextPageOfQuestionsReducer).call,
]);