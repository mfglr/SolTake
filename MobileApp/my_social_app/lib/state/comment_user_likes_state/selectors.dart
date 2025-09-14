import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_likes_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,CommentUserLikeState> selectCommentUserLikesFromState(CommentUserLikesState state, int commentId) =>
  state.commentUserLikes[commentId] ?? Pagination.init(usersPerPage, true);
Pagination<int,CommentUserLikeState> selectCommentUserLikes(Store<AppState> store, int commentId) =>
  selectCommentUserLikesFromState(store.state.commentUserLikes, commentId);
Future<bool> onCommentUserLikesLoaded(Store<AppState> store, int commentId) =>
  store.onChange.map((state) => !selectCommentUserLikesFromState(state.commentUserLikes, commentId).loadingNext).first;
