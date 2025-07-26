import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, QuestionState> selectHomePageQuestionPagination(Store<AppState> store) =>
  store.state.questions.homePageQuestions;

Pagination<int, QuestionUserSaveState> selectQuestionUserSaves(Store<AppState> store) =>
  store.state.questions.questionUserSaves;

Pagination<int, QuestionState> selectSearchPageQuestion(Store<AppState> store) =>
  store.state.questions.searchPageQuestions;

Pagination<int, QuestionState> selectUserQuestionsFromState(QuestionsState state, int userId) =>
  state.userQuestions[userId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectUserQuestions(Store<AppState> store, int userId) =>
  selectUserQuestionsFromState(store.state.questions, userId);

Pagination<int, QuestionState> selectUserSolvedQuestionsFromState(QuestionsState state, int userId) =>
  state.userSolvedQuestions[userId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  selectUserSolvedQuestionsFromState(store.state.questions, userId);

Pagination<int, QuestionState> selectUserUnsolvedQuestionsFromState(QuestionsState state, int userId) =>
  state.userUnsolvedQuestions[userId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  selectUserUnsolvedQuestionsFromState(store.state.questions, userId);

Pagination<int, QuestionState> selectExamQuestionsFromState(QuestionsState state, int examId) =>
  state.examQuestions[examId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectExamQuestions(Store<AppState> store, int examId) =>
  selectExamQuestionsFromState(store.state.questions, examId);

Pagination<int, QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  store.state.questions.subjectQuestions[subjectId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  store.state.questions.topicQuestions[topicId] ?? Pagination.init(questionsPerPage, true);

Pagination<int, QuestionUserLikeState> selectQuestionUserLikes(Store<AppState> store, int questionId) =>
  store.state.questions.questionUserLikes[questionId] ?? Pagination.init(questionUserLikesPerPage, true);