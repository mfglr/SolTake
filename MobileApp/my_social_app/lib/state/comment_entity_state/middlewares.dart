import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
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
    final likes = store.state.commentEntityState.entities[action.commentId]!.likes;
    if(likes.isLast){
      CommentService()
        .getCommentLikes(action.commentId, likes.lastValue,usersPerPage,true)
        .then((users){
          store.dispatch(AddNextPageCommentLikesAction(commentId: action.commentId, userIds: users.map((e) => e.id)));
          store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
          store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));         
        });
    }
  }
  next(action);
}
void likeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LikeCommentAction){
    final int userId = store.state.accountState!.id;
    CommentService()
      .like(action.questionCommentId)
      .then((_) => store.dispatch(
        LikeCommentSuccessAction(
          questionCommentId: action.questionCommentId,
          userId: userId
        )
      )
    );
  }
  next(action);
}
void dislikeCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DislikeCommentAction){
    final int userId = store.state.accountState!.id;
    CommentService()
      .dislike(action.questionCommentId)
      .then((_) => store.dispatch(
        DislikeCommentSuccessAction(
          questionCommentId: action.questionCommentId,
          userId: userId
        )
      ));
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
      .getByParentId(action.commentId, pagination.lastValue, commentsPerPage,true)
      .then((replies){
        store.dispatch(AddNextPageCommentRepliesAction(commentId: action.commentId,replyIds: replies.map((e) => e.id)));
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
