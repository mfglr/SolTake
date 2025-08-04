import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

EntityContainer<QuestionState> selectQuestion(Store<AppState> store, int questionId) =>
  store.state.questions.questions[questionId];
Pagination<int, QuestionUserSaveState> selectQuestionUserSaves(Store<AppState> store) =>
  store.state.questions.questionUserSaves;
Pagination<int, QuestionState> selectSearchPageQuestion(Store<AppState> store) =>
  store.state.questions.searchPageQuestions;

Pagination<int, QuestionState> selectSubjectQuestionsFromState(QuestionsState state, int subjectId) =>
  state.subjectQuestions[subjectId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  selectSubjectQuestionsFromState(store.state.questions, subjectId);

Pagination<int, QuestionState> selectTopicQuestionsFromState(QuestionsState state, int topicId) =>
  state.topicQuestions[topicId] ?? Pagination.init(questionsPerPage, true);
Pagination<int, QuestionState> selectTopicQuestions(Store<AppState> store, int topicId) =>
  selectTopicQuestionsFromState(store.state.questions, topicId);

Pagination<int, QuestionUserLikeState> selectQuestionUserLikesFromState(QuestionsState state, int questionId) =>
  state.questionUserLikes[questionId] ?? Pagination.init(questionUserLikesPerPage, true);
Pagination<int, QuestionUserLikeState> selectQuestionUserLikes(Store<AppState> store, int questionId) =>
  selectQuestionUserLikesFromState(store.state.questions, questionId);
Future<bool> onQuestionUserLikesLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionUserLikesFromState(store.state.questions, questionId).loadingNext).first;