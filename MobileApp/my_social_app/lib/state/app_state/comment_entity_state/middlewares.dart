import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/comment_user_like_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

// void createCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
//   if(action is CreateCommentAction){
//     CommentService()
//       .createComment(action.content, action.questionId, action.solutionId, action.repliedId)
//       .then((comment){
//         store.dispatch(AddCommentAction(comment: comment.toCommentState()));
//         if(comment.questionId != null){
//           store.dispatch(AddQuestionCommentAction(questionId: action.questionId!, commenId: comment.id));
//         }
//         if(comment.solutionId != null){
//           store.dispatch(AddSolutionCommentAction(solutionId: action.solutionId!, commentId: comment.id));
//         }
//         if(comment.parentId != null){
//           store.dispatch(AddCommentReplyAction(replyId: comment.id, commentId: comment.parentId!));
//         }
//       });
//   }
//   next(action);
// }

void loadCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadCommentAction){
    if(store.state.commentEntityState.getValue(action.commentId) == null){
      CommentService()
        .getById(action.commentId)
        .then((comment) => store.dispatch(AddCommentAction(comment: comment.toCommentState())));
    }
  }
  next(action);
}
void loadCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadCommentsAction){
    final ids = action.commentIds.where((id) => store.state.commentEntityState.getValue(id) == null);
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
    final pagination = store.state.commentEntityState.getValue(action.commentId)!.likes;
    CommentUserLikeService()
      .get(action.commentId, pagination.next)
      .then((likes) => store.dispatch(NextCommentLikesSuccessAction(commentId: action.commentId,commentUserLikes: likes.map((e) => e.toCommentUserLikeState()))));
  }
  next(action);
}

void likeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LikeCommentAction){
    final user = store.state.currentUser!;
    CommentUserLikeService()
      .create(action.commentId)
      .then((response) => store.dispatch(LikeCommentSuccessAction(
        commentId: action.commentId,
        commentUserLike: CommentUserLikeState(
          id: response.id,
          userId: user.id,
          userName: user.userName,
          name: user.name,
          image: user.image
        )
      )));
  }
  next(action);
}
void dislikeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DislikeCommentAction){
    CommentUserLikeService()
      .delete(action.commentId)
      .then((_) => store.dispatch(DislikeCommentSuccessAction(commentId: action.commentId, userId:store.state.login.login!.id )));
  }
  next(action);
}

void nextCommentChildrenMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextCommentChildrenAction){
    final pagination = store.state.commentEntityState.getValue(action.commentId)!.children;
    CommentService()
      .getByParentId(action.commentId, pagination.next)
      .then((replies){
        store.dispatch(NextCommentChildrenSuccessAction(commentId: action.commentId, childIds: replies.map((e) => e.id)));
        store.dispatch(AddCommentsAction(comments: replies.map((e) => e.toCommentState())));
      })
      .catchError((e){
        store.dispatch(NextCommentChildrenFailedAction(commentId: action.commentId));
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