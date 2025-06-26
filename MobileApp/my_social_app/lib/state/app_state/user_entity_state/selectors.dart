import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> selectUserQuestionsPagination(Store<AppState> store, int userId)
  => store.state.userEntityState.getValue(userId)!.questions;
Iterable<QuestionState> selectUserQuestions(Store<AppState> store, int userId)
  => selectUserQuestionsPagination(store, userId).values.map((id) => store.state.questionEntityState.getValue(id.id)!);

Pagination<int,Id<int>> selectUserSolvedQuestionsPagination(Store<AppState> store, int userId)
  => store.state.userEntityState.getValue(userId)!.solvedQuestions;
Iterable<QuestionState> selectUserSolvedQuestions(Store<AppState> store, int userId)
  => selectUserSolvedQuestionsPagination(store, userId).values.map((id) => store.state.questionEntityState.getValue(id.id)!);

Pagination<int,Id<int>> selectUserUnsolvedQuestionsPagination(Store<AppState> store, int userId)
  => store.state.userEntityState.getValue(userId)!.unsolvedQuestions;
Iterable<QuestionState> selectUserUnsolvedQuestions(Store<AppState> store, int userId)
  => selectUserUnsolvedQuestionsPagination(store, userId).values.map((id) => store.state.questionEntityState.getValue(id.id)!);
