import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_likes_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, QuestionUserLikeState> selectQuestionUserLikesFromState(QuestionUserLikesState state, int questionId) =>
  state.likes[questionId] ?? Pagination.init(questionUserLikesPerPage, true);
Pagination<int, QuestionUserLikeState> selectQuestionUserLikes(Store<AppState> store, int questionId) =>
  selectQuestionUserLikesFromState(store.state.questionUserLikes, questionId);
Future<bool> onQuestionUserLikesLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionUserLikesFromState(state.questionUserLikes, questionId).loadingNext).first;