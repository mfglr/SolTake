
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/new_questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:redux/redux.dart';

//home questions
KeyPagination<int> selectHomeQuestionPagination(Store<AppState> store) => store.state.newQuetions.homeQuestions;
Iterable<QuestionState> selectHomeQuestions(Store<AppState> store) =>
  selectHomeQuestionPagination(store).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectHomePaginationAndQuestions(Store<AppState> store) =>
  (selectHomeQuestionPagination(store), selectHomeQuestions(store));
Future<bool> onHomeQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.newQuetions.homeQuestions.loadingNext).first;
//home questions

//video questions
KeyPagination<int> selectVideoQuestionPagination(Store<AppState> store) => 
  store.state.newQuetions.videoQuestions;
Iterable<QuestionState> selectVideoQuestions(Store<AppState> store) =>
  selectVideoQuestionPagination(store).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectVideoPaginationAndQuestions(Store<AppState> store) =>
  (selectVideoQuestionPagination(store), selectVideoQuestions(store));
Future<bool> onVideoQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.newQuetions.videoQuestions.loadingNext).first;
//video questions

//user questions
KeyPagination<int> selectUserQuestionPaginationFromState(NewQuestionsState state, int userId) =>
  state.userQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserQuestionPagination(Store<AppState> store, int userId) =>
  selectUserQuestionPaginationFromState(store.state.newQuetions, userId);
Iterable<QuestionState> selectUserQuestions(Store<AppState> store, int userId) =>
  selectUserQuestionPagination(store, userId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectUserPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserQuestionPagination(store, userId), selectUserQuestions(store, userId));
Future<bool> onUserQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserQuestionPaginationFromState(state.newQuetions, userId).loadingNext).first;
//user questions

//user solved questions
KeyPagination<int> selectUserSolvedQuestionPaginationFromState(NewQuestionsState state, int userId) =>
  state.userSolvedQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserSolvedQuestionPagination(Store<AppState> store, int userId) =>
  selectUserSolvedQuestionPaginationFromState(store.state.newQuetions, userId);
Iterable<QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  selectUserSolvedQuestionPagination(store,userId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
//user solved questions

//user unsolved questions
KeyPagination<int> selectUserUnsolvedQuestionPaginationFromState(NewQuestionsState state, int userId) =>
  state.userUnsolvedQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserUnsolvedQuestionPagination(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPaginationFromState(store.state.newQuetions, userId);
Iterable<QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPagination(store,userId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
//user unsolved questions