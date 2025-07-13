import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int, CommentState> addNextCommentsReducer(EntityState<int, CommentState> prev, AddNextCommentsAction action)
  => prev.appendMany(action.comments);

EntityState<int, CommentState> refreshCommentsReducer(EntityState<int, CommentState> prev, RefreshCommentsAction action)
  => prev.where((x) => x.questionId != action.questionId).appendMany(action.comments);

Reducer<EntityState<int,CommentState>> commentsReducer = combineReducers<EntityState<int, CommentState>>([
  TypedReducer<EntityState<int, CommentState>, AddNextCommentsAction>(addNextCommentsReducer).call,
  TypedReducer<EntityState<int, CommentState>, RefreshCommentsAction>(refreshCommentsReducer).call,
]);