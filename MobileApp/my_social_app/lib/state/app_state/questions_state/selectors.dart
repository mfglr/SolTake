
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:redux/redux.dart';

EntityContainer<QuestionState> selectQuestion(Store<AppState> store, int questionId) =>
  store.state.questions.questions[questionId];

//home questions
KeyPagination<int> selectHomeQuestionPagination(Store<AppState> store) => store.state.questions.homeQuestions;
Iterable<QuestionState> selectHomeQuestions(Store<AppState> store) =>
  selectHomeQuestionPagination(store).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectHomePaginationAndQuestions(Store<AppState> store) =>
  (selectHomeQuestionPagination(store), selectHomeQuestions(store));
Future<bool> onHomeQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.questions.homeQuestions.loadingNext).first;
//home questions

//video questions
KeyPagination<int> selectVideoQuestionPagination(Store<AppState> store) => 
  store.state.questions.videoQuestions;
Iterable<QuestionState> selectVideoQuestions(Store<AppState> store) =>
  selectVideoQuestionPagination(store).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectVideoPaginationAndQuestions(Store<AppState> store) =>
  (selectVideoQuestionPagination(store), selectVideoQuestions(store));
Future<bool> onVideoQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.questions.videoQuestions.loadingNext).first;
//video questions

//search page questions
KeyPagination<int> selectSearchPageQuestionPagination(Store<AppState> store) => 
  store.state.questions.searchQuestions;
Iterable<QuestionState> selectSearchPageQuestions(Store<AppState> store) =>
  selectSearchPageQuestionPagination(store).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectSearchPagePaginationAndQuestions(Store<AppState> store) =>
  (selectSearchPageQuestionPagination(store), selectSearchPageQuestions(store));
Future<bool> onSearchPageQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.questions.searchQuestions.loadingNext).first;
//search page questions

//user questions
KeyPagination<int> selectUserQuestionPaginationFromState(QuestionsState state, int userId) =>
  state.userQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserQuestionPagination(Store<AppState> store, int userId) =>
  selectUserQuestionPaginationFromState(store.state.questions, userId);
Iterable<QuestionState> selectUserQuestions(Store<AppState> store, int userId) =>
  selectUserQuestionPagination(store, userId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectUserPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserQuestionPagination(store, userId), selectUserQuestions(store, userId));
Future<bool> onUserQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserQuestionPaginationFromState(state.questions, userId).loadingNext).first;
//user questions

//user solved questions
KeyPagination<int> selectUserSolvedQuestionPaginationFromState(QuestionsState state, int userId) =>
  state.userSolvedQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserSolvedQuestionPagination(Store<AppState> store, int userId) =>
  selectUserSolvedQuestionPaginationFromState(store.state.questions, userId);
Iterable<QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  selectUserSolvedQuestionPagination(store,userId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectUserSolvedPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserSolvedQuestionPagination(store, userId), selectUserSolvedQuestions(store, userId));
Future<bool> onUserSolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserSolvedQuestionPaginationFromState(state.questions, userId).loadingNext).first;
//user solved questions

//user unsolved questions
KeyPagination<int> selectUserUnsolvedQuestionPaginationFromState(QuestionsState state, int userId) =>
  state.userUnsolvedQuestions[userId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectUserUnsolvedQuestionPagination(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPaginationFromState(store.state.questions, userId);
Iterable<QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionPagination(store,userId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectUserUnsolvedPaginationAndQuestions(Store<AppState> store, int userId) =>
  (selectUserUnsolvedQuestionPagination(store, userId), selectUserUnsolvedQuestions(store, userId));
Future<bool> onUserUnsolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectUserUnsolvedQuestionPaginationFromState(state.questions, userId).loadingNext).first;
//user unsolved questions

//exam questions
KeyPagination<int> selectExamQuestionPaginationFromState(QuestionsState state, int examId) =>
  state.examQuestions[examId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectExamQuestionPagination(Store<AppState> store, int examId) =>
  selectExamQuestionPaginationFromState(store.state.questions, examId);
Iterable<QuestionState> selectExamQuestions(Store<AppState> store, int examId) =>
  selectExamQuestionPagination(store,examId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectExamPaginationAndQuestions(Store<AppState> store, int examId) =>
  (selectExamQuestionPagination(store, examId), selectExamQuestions(store, examId));
Future<bool> onExamQuestionsLoaded(Store<AppState> store, int examId) =>
  store.onChange.map((state) => !selectExamQuestionPaginationFromState(state.questions, examId).loadingNext).first;
//exam questions

//subject questions
KeyPagination<int> selectSubjectQuestionPaginationFromState(QuestionsState state, int subjectId) =>
  state.subjectQuestions[subjectId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectSubjectQuestionPagination(Store<AppState> store, int subjectId) =>
  selectSubjectQuestionPaginationFromState(store.state.questions, subjectId);
Iterable<QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  selectSubjectQuestionPagination(store,subjectId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectSubjectPaginationAndQuestions(Store<AppState> store, int subjectId) =>
  (selectSubjectQuestionPagination(store, subjectId), selectSubjectQuestions(store, subjectId));
Future<bool> onSubjectQuestionsLoaded(Store<AppState> store, int subjectId) =>
  store.onChange.map((state) => !selectSubjectQuestionPaginationFromState(state.questions, subjectId).loadingNext).first;
//subject questions

//topic questions
KeyPagination<int> selectTopicQuestionPaginationFromState(QuestionsState state, int topicId) =>
  state.topicQuestions[topicId] ?? KeyPagination.init(questionsPerPage, true);
KeyPagination<int> selectTopicQuestionPagination(Store<AppState> store, int topicId) =>
  selectTopicQuestionPaginationFromState(store.state.questions, topicId);
Iterable<QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  selectTopicQuestionPagination(store,topicId).keys.map((key) => store.state.questions.questions[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectTopicPaginationAndQuestions(Store<AppState> store, int topicId) =>
  (selectTopicQuestionPagination(store, topicId), selectTopicQuestions(store, topicId));
Future<bool> onTopicQuestionsLoaded(Store<AppState> store, int topicId) =>
  store.onChange.map((state) => !selectTopicQuestionPaginationFromState(state.questions, topicId).loadingNext).first;
//topic questions

