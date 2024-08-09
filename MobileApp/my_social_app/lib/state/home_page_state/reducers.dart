import 'package:my_social_app/state/home_page_state/actions.dart';
import 'package:my_social_app/state/home_page_state/home_page_state.dart';
import 'package:redux/redux.dart';

HomePageState prependQuestionReducer(HomePageState prev,AddHomePageQuestionAction action)
  => prev.prependQuestion(action.questionId);
HomePageState getNextPageQuestionsReducer(HomePageState prev,GetNextPageHomeQuestionsAction action)
  => prev.getNextPageQuestions();
HomePageState addNextPageQuestionsReducer(HomePageState prev,AddNextPageHomeQuestionsAction action)
  => prev.addNextPageQuestions(action.questionIds);

Reducer<HomePageState> homePageReducers = combineReducers<HomePageState>([
  TypedReducer<HomePageState,AddHomePageQuestionAction>(prependQuestionReducer).call,
  TypedReducer<HomePageState,GetNextPageHomeQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<HomePageState,AddNextPageHomeQuestionsAction>(addNextPageQuestionsReducer).call,
]);