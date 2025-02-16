import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadCommentAction){
    if(store.state.commentEntityState.entities[action.commentId] == null){
      CommentService()
        .getById(action.commentId)
        .then((comment) => store.dispatch(AddCommentAction(comment: comment.toCommentState())));
    }
  }
  next(action);
}
void loadCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadCommentsAction){
    final ids = action.commentIds.where((id) => store.state.commentEntityState.entities[id] == null);
    if(ids.isNotEmpty){
      CommentService()
        .getByIds(ids)
        .then((comments) => store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState()))));
    }
  }
  next(action);
}

void getNextPageCommentLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextCommentLikesAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.likes;
    CommentService()
      .getCommentLikes(action.commentId, pagination.next)
      .then((likes){
        store.dispatch(AddCommentUserLikesAction(likes: likes.map((e) => e.toCommentUserLikeState())));
        store.dispatch(AddUsersAction(users: likes.map((e) => e.user!.toUserState())));
        store.dispatch(NextCommentLikesSuccessAction(commentId: action.commentId,likeIds: likes.map((e) => e.id)));
      });
  }
  next(action);
}
void likeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LikeCommentAction){
    CommentService()
      .like(action.commentId)
      .then((like){
        store.dispatch(LikeCommentSuccessAction(commentId: action.commentId,likeId: like.id));
        store.dispatch(AddCommentUserLikeAction(like: like.toCommentUserLikeState()));
      });
  }
  next(action);
}
void dislikeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DislikeCommentAction){
    final int accountId = store.state.loginState!.id;
    CommentService()
      .dislike(action.commentId)
      .then((_){
        final likeId = store.state.commentUserLikeEntityState.select(action.commentId,accountId)?.id ?? 0;
        store.dispatch(DislikeCommentSuccessAction(commentId: action.commentId,likeId: likeId));
        store.dispatch(RemoveCommentUserLikeAction(likeId: likeId));
      });
  }
  next(action);
}

void nextCommentRepliesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextCommentRepliesAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.replies;
    CommentService()
      .getByParentId(action.commentId, pagination.next)
      .then((replies){
        store.dispatch(NextCommentRepliesSuccessAction(commentId: action.commentId,replyIds: replies.map((e) => e.id)));
        store.dispatch(AddCommentsAction(comments: replies.map((e) => e.toCommentState())));
      })
      .catchError((e){
        store.dispatch(NextCommentRepliesFailedAction(commentId: action.commentId));
        throw e;
      });
  }
  next(action);
}

void removeCommentDispathcer(Store<AppState> store, CommentState comment){
  if(comment.parentId != null){
    store.dispatch(RemoveCommentReplyAction(commentId: comment.parentId!, replyId: comment.id));
  }
  else if(comment.questionId != null){
    store.dispatch(RemoveQuestionCommentAction(commentId: comment.id, questionid: comment.questionId!));
  }
  else{
    store.dispatch(RemoveSolutionCommentAction(solutionId: comment.solutionId!, commentId: comment.id));
  }
  store.dispatch(RemoveCommentSuccessAction(commentId: comment.id));
}
void removeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveCommentAction){
    CommentService()
      .deleteComment(action.comment.id)
      .then((_) => removeCommentDispathcer(store,action.comment));
  }
  next(action);
}