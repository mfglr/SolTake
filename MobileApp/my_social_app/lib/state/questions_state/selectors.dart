import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/questions_state/question_status.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:redux/redux.dart';

LoadableContainer<int, QuestionState<int>> selectQuestion(Store<AppState> store, int questionId) =>
  store.state.questions.loadableCollection[questionId];

//home questions
ContainerPagination<int, QuestionState<int>> selectHomeQuestions(Store<AppState> store) =>
  store.state.questions.selectHomeQuestions();
Future<bool> onHomeQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.questions.selectHomeQuestions().loadingNext).first;
//home questions

//video questions
KeyPagination<int> selectVideoQuestionPagination(Store<AppState> store) => 
  store.state.questions.videoQuestions;
Iterable<QuestionState> selectVideoQuestions(Store<AppState> store) =>
  selectVideoQuestionPagination(store).keys.map((key) => store.state.questions.loadableCollection[key].entity!);
(KeyPagination<int>, Iterable<QuestionState>) selectVideoPaginationAndQuestions(Store<AppState> store) =>
  (selectVideoQuestionPagination(store), selectVideoQuestions(store));
Future<bool> onVideoQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !store.state.questions.videoQuestions.loadingNext).first;
//video questions

//search page questions
ContainerPagination<int, QuestionState<int>> selectSearchPageQuestions(Store<AppState> store) =>
  store.state.questions.selectSearchPageQuestions();
Future<bool> onSearchPageQuestionsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.questions.selectSearchPageQuestions().loadingNext).first;
//search page questions

//user questions
ContainerPagination<int, QuestionState<int>> selectUserQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserQuestions(userId);
Iterable<UploadableContainer<String, QuestionState<String>>> selectUploadQuestions(Store<AppState> store) =>
  store.state.questions.uploadableCollection.containers;
Future<bool> onUserQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserQuestions(userId).loadingNext).first;
//user questions

//user solved questions
ContainerPagination<int, QuestionState<int>> selectUserSolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserSolvedQuestions(userId);
Iterable<UploadableContainer<String, QuestionState<String>>> selectUploadSolvedQuestions(Store<AppState> store) =>
  store.state.questions.uploadableCollection.containers.where((e) => e.entity != null && e.entity!.state == QuestionStatus.solved);
Future<bool> onUserSolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserSolvedQuestions(userId).loadingNext).first;
//user solved questions

//user unsolved questions
ContainerPagination<int, QuestionState<int>> selectUserUnsolvedQuestions(Store<AppState> store, int userId) =>
  store.state.questions.selectUserUnsolvedQuestions(userId);
Iterable<UploadableContainer<String, QuestionState<String>>> selectUploadUnsolvedQuestions(Store<AppState> store) =>
  store.state.questions.uploadableCollection.containers.where((e) => e.entity != null && e.entity!.state == QuestionStatus.unsolved);
Future<bool> onUserUnsolvedQuestionsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !state.questions.selectUserUnsolvedQuestions(userId).loadingNext).first;
//user unsolved questions

//exam questions
ContainerPagination<int, QuestionState<int>> selectExamQuestions(Store<AppState> store, int examId) =>
  store.state.questions.selectExamQuestions(examId);
Future<bool> onExamQuestionsLoaded(Store<AppState> store, int examId) =>
  store.onChange.map((state) => !state.questions.selectExamQuestions(examId).loadingNext).first;
//exam questions

//subject questions
ContainerPagination<int, QuestionState<int>> selectSubjectQuestions(Store<AppState> store, int subjectId) =>
  store.state.questions.selectSubjectQuestions(subjectId);
Future<bool> onSubjectQuestionsLoaded(Store<AppState> store, int subjectId) =>
  store.onChange.map((state) => !state.questions.selectSubjectQuestions(subjectId).loadingNext).first;
//subject questions

//topic questions
ContainerPagination<int, QuestionState<int>> selectTopicQuestions(Store<AppState> store, int topicId) =>
  store.state.questions.selectTopicQuestions(topicId);
Future<bool> onTopicQuestionsLoaded(Store<AppState> store, int topicId) =>
  store.onChange.map((state) => !state.questions.selectTopicQuestions(topicId).loadingNext).first;
//topic questions

