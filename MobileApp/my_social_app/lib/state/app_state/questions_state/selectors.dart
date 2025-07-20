import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/to_pagination_state.dart';
import 'package:redux/redux.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart' as pagination;

//home page questions
KeyPagination<int> selectHomePageQuestionKeyPagination(Store<AppState> store) =>
  store.state.questions.homePageQuestions;
Pagination<int, QuestionState> selectHomePageQuestionPagination(Store<AppState> store) =>
  toPaginationState(store.state.questions.questions, selectHomePageQuestionKeyPagination(store));
pagination.Page<int> selectHomePageQuestionNextPage(Store<AppState> store) =>
  selectHomePageQuestionKeyPagination(store).next;
pagination.Page<int> selectHomePageQuestionFirstPage(Store<AppState> store) =>
  selectHomePageQuestionKeyPagination(store).first;
Future<bool> onHomePageQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !selectHomePageQuestionKeyPagination(store).loadingNext).first;
//home page questions

//saved questions
KeyPagination<int> selectSavedQuestionKeyPagination(Store<AppState> store) =>
  store.state.questions.savedQuestions;
Pagination<int, QuestionState> selectSavedQuestionPagination(Store<AppState> store) =>
  toPaginationState(store.state.questions.questions, selectSavedQuestionKeyPagination(store));
pagination.Page<int> selectSavedQuestionNextPage(Store<AppState> store) =>
  selectSavedQuestionKeyPagination(store).next;
pagination.Page<int> selectSavedQuestionFirstPage(Store<AppState> store) =>
  selectSavedQuestionKeyPagination(store).first;
Future<bool> onSavedQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !selectSavedQuestionKeyPagination(store).loadingNext).first;
//saved questions

Pagination<int, QuestionState> selectSearchPageQuestionPagination(Store<AppState> store) =>
  store.state.questions.searchPageQuestions;

Pagination<int, QuestionState> selectUserQuestions(Store<AppState> store, int userId) =>
  store.state.questions.userQuestions[userId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.userSolvedQuestions[userId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.userUnsolvedQuestions[userId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectExamQuestions(Store<AppState> store, int examId) =>
  store.state.questions.examQuestions[examId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  store.state.questions.subjectQuestions[subjectId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  store.state.questions.topicQuestions[topicId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionUserLikeState> selectQuestionUserLikes(Store<AppState> store, int questionId) =>
  store.state.questions.questionUserLikes[questionId] ?? Pagination.init(questionUserLikesPerPage, true);