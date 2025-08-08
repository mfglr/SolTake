
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

//search page questions
KeyPagination<int> selectSearchPageQuestionPagination(Store<AppState> store) => 
  store.state.newQuetions.searchQuestions;
Iterable<QuestionState> selectSearchPageQuestions(Store<AppState> store) =>
  selectSearchPageQuestionPagination(store).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectSearchPagePaginationAndQuestions(Store<AppState> store) =>
  (selectSearchPageQuestionPagination(store), selectSearchPageQuestions(store));
Future<bool> onSearchPageQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.newQuetions.searchQuestions.loadingNext).first;
//search page questions

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
(KeyPagination<int>, Iterable<QuestionState>) selectUserSolvedPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserSolvedQuestionPagination(store, userId), selectUserSolvedQuestions(store, userId));
Future<bool> onUserSolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserSolvedQuestionPaginationFromState(state.newQuetions, userId).loadingNext).first;
//user solved questions

//user unsolved questions
KeyPagination<int> selectUserUnsolvedQuestionPaginationFromState(NewQuestionsState state, int userId) =>
  state.userUnsolvedQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserUnsolvedQuestionPagination(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPaginationFromState(store.state.newQuetions, userId);
Iterable<QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPagination(store,userId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectUserUnsolvedPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserUnsolvedQuestionPagination(store, userId), selectUserUnsolvedQuestions(store, userId));
Future<bool> onUserUnsolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserUnsolvedQuestionPaginationFromState(state.newQuetions, userId).loadingNext).first;
//user unsolved questions

//exam questions
KeyPagination<int> selectExamQuestionPaginationFromState(NewQuestionsState state, int examId) =>
  state.examQuestions[examId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectExamQuestionPagination(Store<AppState> store, int examId) =>
  selectExamQuestionPaginationFromState(store.state.newQuetions, examId);
Iterable<QuestionState> selectExamQuestions(Store<AppState> store, int examId) =>
  selectExamQuestionPagination(store,examId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectExamPaginationAndQuestions(Store<AppState> store, int examId) =>
  (selectExamQuestionPagination(store, examId), selectExamQuestions(store, examId));
Future<bool> onExamQuestionsLoaded(Store<AppState> store, int examId) =>
  store.onChange.map((state) => !selectExamQuestionPaginationFromState(state.newQuetions, examId).loadingNext).first;
//exam questions

//subject questions
KeyPagination<int> selectSubjectQuestionPaginationFromState(NewQuestionsState state, int subjectId) =>
  state.subjectQuestions[subjectId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectSubjectQuestionPagination(Store<AppState> store, int subjectId) =>
  selectSubjectQuestionPaginationFromState(store.state.newQuetions, subjectId);
Iterable<QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  selectSubjectQuestionPagination(store,subjectId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectSubjectPaginationAndQuestions(Store<AppState> store, int subjectId) =>
  (selectSubjectQuestionPagination(store, subjectId), selectSubjectQuestions(store, subjectId));
Future<bool> onSubjectQuestionsLoaded(Store<AppState> store, int subjectId) =>
  store.onChange.map((state) => !selectSubjectQuestionPaginationFromState(state.newQuetions, subjectId).loadingNext).first;
//subject questions

//topic questions
KeyPagination<int> selectTopicQuestionPaginationFromState(NewQuestionsState state, int topicId) =>
  state.topicQuestions[topicId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectTopicQuestionPagination(Store<AppState> store, int topicId) =>
  selectTopicQuestionPaginationFromState(store.state.newQuetions, topicId);
Iterable<QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  selectTopicQuestionPagination(store,topicId).keys.map((key) => store.state.newQuetions.questions[key]!.entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectTopicPaginationAndQuestions(Store<AppState> store, int topicId) =>
  (selectTopicQuestionPagination(store, topicId), selectTopicQuestions(store, topicId));
Future<bool> onTopicQuestionsLoaded(Store<AppState> store, int topicId) =>
  store.onChange.map((state) => !selectTopicQuestionPaginationFromState(state.newQuetions, topicId).loadingNext).first;
//topic questions

