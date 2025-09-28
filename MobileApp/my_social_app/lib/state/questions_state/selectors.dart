import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:redux/redux.dart';

EntityContainer<int, QuestionState> selectQuestion(Store<AppState> store, int questionId) =>
  store.state.questions.questions[questionId];

//home questions
ContainerPagination<int, QuestionState> selectHomeQuestions(Store<AppState> store) =>
  store.state.questions.selectHomeQuestions();
Future<bool> onHomeQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.questions.selectHomeQuestions().loadingNext).first;
//home questions

//video questions
ContainerPagination<int, QuestionState> selectVideoQuestions(Store<AppState> store) =>
  store.state.questions.selectVideoQuestions();
Future<bool> onVideoQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.questions.selectVideoQuestions().loadingNext).first;
//video questions

//search page questions
ContainerPagination<int, QuestionState> selectSearchPageQuestions(Store<AppState> store) =>
  store.state.questions.selectSearchPageQuestions();
Future<bool> onSearchPageQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.questions.selectSearchPageQuestions().loadingNext).first;
//search page questions

//user questions
ContainerPagination<int, QuestionState> selectUserQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserQuestions(userId);
Future<bool> onUserQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserQuestions(userId).loadingNext).first;
//user questions

//user solved questions
ContainerPagination<int, QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserSolvedQuestions(userId);
Future<bool> onUserSolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserSolvedQuestions(userId).loadingNext).first;
//user solved questions

//user unsolved questions
ContainerPagination<int, QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserUnsolvedQuestions(userId);
Future<bool> onUserUnsolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserUnsolvedQuestions(userId).loadingNext).first;
//user unsolved questions

//exam questions
ContainerPagination<int, QuestionState> selectExamQuestions(Store<AppState> store, int examId) =>
  store.state.questions.selectExamQuestions(examId);
Future<bool> onExamQuestionsLoaded(Store<AppState> store, int examId) =>
  store.onChange.map((state) => !state.questions.selectExamQuestions(examId).loadingNext).first;
//exam questions

//subject questions
ContainerPagination<int, QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  store.state.questions.selectSubjectQuestions(subjectId);
Future<bool> onSubjectQuestionsLoaded(Store<AppState> store, int subjectId) =>
  store.onChange.map((state) => !state.questions.selectSubjectQuestions(subjectId).loadingNext).first;
//subject questions

//topic questions
ContainerPagination<int, QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  store.state.questions.selectTopicQuestions(topicId);
Future<bool> onTopicQuestionsLoaded(Store<AppState> store, int topicId) =>
  store.onChange.map((state) => !state.questions.selectTopicQuestions(topicId).loadingNext).first;
//topic questions

