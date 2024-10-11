import 'package:my_social_app/state/app_state/home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/home_page_state/home_page_state.dart';
import 'package:redux/redux.dart';

HomePageState nextQuestionsReducer(HomePageState prev,NextHomeQuestionsAction action)
  => prev.startLoadingNextQuestions();
HomePageState nextQuestionsSuccessReducer(HomePageState prev,NextHomeQuestionsSuccessAction action)
  => prev.addNextQuestions(action.questionIds);
HomePageState nextQuestionsFailedReducer(HomePageState prev,NextHomeQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions();

HomePageState prevQuestionsReducer(HomePageState prev,PrevHomePageQuestionsAction action)
  => prev.startLoadingPrevPageQuestions();
HomePageState prevQuestionsSuccessReducer(HomePageState prev,PrevHomeQuestionsSuccessAction action)
  => prev.addPrevPageQuestions(action.questionIds);
HomePageState prevQuestionsFailedReducer(HomePageState prev,PrevHomeQuestionsFailedAction action)
  => prev.stopLoadingPrevPageQuestions();

Reducer<HomePageState> homePageReducers = combineReducers<HomePageState>([
  TypedReducer<HomePageState,NextHomeQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<HomePageState,NextHomeQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<HomePageState,NextHomeQuestionsFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<HomePageState,PrevHomePageQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<HomePageState,PrevHomeQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<HomePageState,PrevHomeQuestionsFailedAction>(prevQuestionsFailedReducer).call,
]);