import 'package:my_social_app/services/comment_user_like_service.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void likeCommentMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LikeCommentAction){
    var currentUser = store.state.users.usersById[store.state.login.login!.id].entity!;
    CommentUserLikeService()
      .create(action.comment.id)
      .then((response) => store.dispatch(LikeCommentSuccessAction(
        comment: action.comment,
        commentUserLike: CommentUserLikeState(
          id: response.id,
          userName: currentUser.userName,
          name: currentUser.name,
          userId: currentUser.id,
          image: currentUser.image
        )
      )));
  }
  next(action);
}
void dislikeCommentMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DislikeCommentAction){
    final userId = store.state.login.login!.id;
    CommentUserLikeService()
      .delete(action.comment.id)
      .then((response) => store.dispatch(DislikeCommentSuccessAction(
        userId: userId,
        comment: action.comment,
      )));
  }
  next(action);
}
void nextCommentLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextCommentUserLikesAction){
    CommentUserLikeService()
      .get(action.commentId, selectCommentUserLikes(store, action.commentId).next)
      .then((likes) => store.dispatch(NextCommentUserLikesSuccessAction(
        commentId: action.commentId,
        commentUserLikes: likes.map((e) => e.toCommentUserLikeState()))
      ))
      .catchError((e){
        store.dispatch(NextCommentUserLikesFailedAction(commentId: action.commentId));
        throw e;
      });
  }
  next(action);
}
void refreshCommentLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RefreshCommentUserLikesAction){
    CommentUserLikeService()
      .get(action.commentId,selectCommentUserLikes(store, action.commentId).first)
      .then((likes) => store.dispatch(RefreshCommentUserLikesSuccessAction(
        commentId: action.commentId,
        commentUserLikes: likes.map((e) => e.toCommentUserLikeState()))
      ))
      .catchError((e){
        store.dispatch(RefreshCommentUserLikesFailedAction(commentId: action.commentId));
        throw e;
      });
  }
  next(action);
}