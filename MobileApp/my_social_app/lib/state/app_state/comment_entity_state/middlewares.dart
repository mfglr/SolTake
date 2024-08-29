import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getNextPageCommentLikesIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageCommentLikesIfNoPageAction){
    final likes = store.state.commentEntityState.entities[action.commentId]!.likes;
    if(!likes.hasAtLeastOnePage){
      store.dispatch(GetNextPageCommentLikesAction(commentId: action.commentId));
    }
  }
  next(action);
}
void getNextPageCommentLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageCommentLikesAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.likes;
    if(pagination.isLast){
      CommentService()
        .getCommentLikes(action.commentId, pagination.next)
        .then((likes){
          store.dispatch(AddCommentUserLikesAction(likes: likes.map((e) => e.toCommentUserLikeState())));
          store.dispatch(AddNextPageCommentLikesAction(commentId: action.commentId,likeIds: likes.map((e) => e.id)));
          store.dispatch(AddUsersAction(users: likes.map((e) => e.appUser!.toUserState())));
          store.dispatch(AddUserImagesAction(images: likes.map((e) => UserImageState.init(e.appUser!.id))));         
        });
    }
  }
  next(action);
}
void likeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LikeCommentAction){
    CommentService()
      .like(action.commentId)
      .then((like){
        store.dispatch(LikeCommentSuccessAction(commentId: action.commentId,likeId: like.id));
      });
  }
  next(action);
}
void dislikeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DislikeCommentAction){
    final int accountId = store.state.accountState!.id;
    CommentService()
      .dislike(action.commentId)
      .then((_) => store.dispatch(DislikeCommentSuccessAction(commentId: action.commentId,userId: accountId)));
  }
  next(action);
}

void getNextPageCommentRepliesIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageCommentRepliesIfNoPageAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.replies;
    if(!pagination.isLast && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageCommentRepliesAction(commentId: action.commentId));
    }
  }
  next(action);
}
void getNextPageCommentRepliesIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageCommentRepliesIfReadyAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.replies;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageCommentRepliesAction(commentId: action.commentId));
    }
  }
  next(action);
}
void getNextPageCommentRepliesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageCommentRepliesAction){
    final pagination = store.state.commentEntityState.entities[action.commentId]!.replies;
    CommentService()
      .getByParentId(action.commentId, pagination.next)
      .then((replies){
        store.dispatch(AddPrevPageCommentRepliesAction(commentId: action.commentId,replyIds: replies.map((e) => e.id)));
        store.dispatch(AddCommentsAction(comments: replies.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: replies.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}

void loadCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadCommentAction){
    if(store.state.commentEntityState.entities[action.commentId] == null){
      CommentService()
        .getById(action.commentId)
        .then((comment){
          store.dispatch(AddCommentAction(comment: comment.toCommentState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(comment.appUserId)));
        });
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
        .then((comments){
          store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
          store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(e.appUserId))));
        });
    }
  }
  next(action);
}

void removeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveCommentAction){
    CommentService()
      .deleteComment(action.comment.id)
      .then((_){
        if(action.comment.parentId != null){
          store.dispatch(RemoveCommentReplyAction(commentId: action.comment.parentId!, replyId: action.comment.id));
        }
        else if(action.comment.questionId != null){
          store.dispatch(RemoveQuestionCommentAction(commentId: action.comment.id, questionid: action.comment.questionId!));
        }
        else{
          store.dispatch(RemoveSolutionCommentAction(solutionId: action.comment.solutionId!, commentId: action.comment.id));
        }
        store.dispatch(RemoveCommentSuccessAction(commentId: action.comment.id));
      });
  }
  next(action);
}