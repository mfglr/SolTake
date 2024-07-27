import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

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

void nextPageCommentRepliesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageRepliesAction){
    final replies = store.state.commentEntityState.entities[action.commentId]!.replies;
    if(!replies.isLast){
      CommentService()
        .getByParentId(action.commentId,replies.lastId, repliesPerPage)
        .then((replies){
          store.dispatch(
            AddCommentsAction(
              comments: replies.map((e) => e.toCommentState())
            )
          );
          store.dispatch(
            NextPageRepliesSuccessAction(
              commentId: action.commentId,
              replyIds: replies.map((e) => e.id)
            )
          );
        });
    }
  }
  next(action);
}
void nextPageCommentRepliesIfNoRepliesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageRepliesIfNoReplies){
    if(store.state.commentEntityState.entities[action.commentId]!.replies.ids.isEmpty){
      store.dispatch(NextPageRepliesAction(commentId: action.commentId));
    }
  }
  next(action);
}