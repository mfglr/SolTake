import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/comments_state/actions.dart';
import 'package:my_social_app/state/comments_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void createCommentMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateCommentAction){
     CommentService()
      .createComment(action.content, action.questionId, action.solutionId, action.commentId)
      .then((e) => store.dispatch(CreateCommentSuccessAction(comment: e.toCommentState())));
  }
  next(action);
}

void deleteCommentMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteCommentAction){
    CommentService()
      .deleteComment(action.comment.id)
      .then((_) => store.dispatch(DeleteCommentSuccessAction(comment: action.comment)));
  }
  next(action);
}


//question comments
void nextQuestionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionCommentsAction){
    CommentService()
      .getByQuestionId(action.questionId, selectQuestionComments(store, action.questionId).next)
      .then((comments) => store.dispatch(NextQuestionCommentsSuccessAction(
        questionId: action.questionId,
        comments: comments.map((e) => e.toCommentState())
      )))
      .catchError((e){
        store.dispatch(NextQuestionCommentsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionCommentsAction){
    CommentService()
      .getByQuestionId(action.questionId, selectQuestionComments(store, action.questionId).first)
      .then((comments) => store.dispatch(RefreshQuestionCommentsSuccessAction(
        questionId: action.questionId,
        comments: comments.map((e) => e.toCommentState())
      )))
      .catchError((e){
        store.dispatch(RefreshQuestionCommentsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question comments

//solution comments
void nextSolutionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSolutionCommentsAction){
    CommentService()
      .getBySolutionId(action.solutionId, selectSolutionComments(store, action.solutionId).next)
      .then((comments) => store.dispatch(NextSolutionCommentsSuccessAction(
        solutionId: action.solutionId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(NextSolutionCommentsFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
void refreshSolutionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSolutionCommentsAction){
    CommentService()
      .getBySolutionId(action.solutionId, selectSolutionComments(store, action.solutionId).first)
      .then((comments) => store.dispatch(RefreshSolutionCommentsSuccessAction(
        solutionId: action.solutionId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(RefreshSolutionCommentsFailedAction(solutionId: action.solutionId));
        throw e;
      });
  }
  next(action);
}
//solution comments

//comment comments
void nextCommentCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextCommentCommentsAction){
    CommentService()
      .getByParentId(action.commentId, selectCommentComments(store, action.commentId).next)
      .then((comments) => store.dispatch(NextCommentCommentsSuccessAction(
        commentId: action.commentId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(NextCommentCommentsFailedAction(commentId: action.commentId));
        throw e;
      });
  }
  next(action);
}
void refreshCommentCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshCommentCommentsAction){
    CommentService()
      .getByParentId(action.commentId, selectCommentComments(store, action.commentId).first)
      .then((comments) => store.dispatch(RefreshCommentCommentsSuccessAction(
        commentId: action.commentId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(RefreshCommentCommentsFailedAction(commentId: action.commentId));
        throw e;
      });
  }
  next(action);
}
//comment comments