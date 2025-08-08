import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

EntityContainer<QuestionState> selectQuestion(Store<AppState> store, int questionId) =>
  store.state.questions.questions[questionId];
Pagination<int, QuestionUserSaveState> selectQuestionUserSaves(Store<AppState> store) =>
  store.state.questions.questionUserSaves;