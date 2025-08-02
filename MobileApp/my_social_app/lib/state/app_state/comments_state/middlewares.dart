import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void createCommentMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateCommentAction){
    CommentService()
      .createComment(action.content, action.question?.id, action.solution?.id, action.replied?.id)
      .then((e) => store.dispatch(CreateCommentsSuccessAction(
        comment: e.toCommentState(),
        question: action.question,
        solution: action.solution,
        parent: action.parent,
        replied: action.replied,
      )));
  }
  next(action);
}

//question comments
void nextQuestionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionCommentsAction){
    final pagination = selectQuestionComments(store, action.questionId);
    CommentService()
      .getByQuestionId(action.questionId, pagination.next)
      .then((comments) => store.dispatch(NextQuestionCommentsSuccessAction(
        questionId: action.questionId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(NextQuestionCommentsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionCommentsAction){
    final pagination = selectQuestionComments(store, action.questionId);
    CommentService()
      .getByQuestionId(action.questionId, pagination.first)
      .then((comments) => store.dispatch(RefreshQuestionCommentsSuccessAction(
        questionId: action.questionId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(RefreshQuestionCommentsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
//question comments

//solution commetns
void nextSolutionCommentsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSolutionCommentsAction){
    final pagination = selectSolutionComments(store, action.solutionId);
    CommentService()
      .getBySolutionId(action.solutionId, pagination.next)
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
    final pagination = selectSolutionComments(store, action.solutionId);
    CommentService()
      .getBySolutionId(action.solutionId, pagination.first)
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

//children
void nextCommentChildrenMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextCommentChildrenAction){
    final pagination = selectChildren(store, action.parentId);
    CommentService()
      .getByParentId(action.parentId, pagination.next)
      .then((comments) => store.dispatch(NextCommentChildrenSuccessAction(
        parentId: action.parentId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(NextCommentChildrenFailedAction(parentId: action.parentId));
        throw e;
      });
  }
  next(action);
}
void refreshCommentChildrenMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshCommentChildrenAction){
    final pagination = selectChildren(store, action.parentId);
    CommentService()
      .getByParentId(action.parentId, pagination.first)
      .then((comments) => store.dispatch(RefreshCommentChildrenSuccessAction(
        parentId: action.parentId,
        comments: comments.map((e) => e.toCommentState()))
      ))
      .catchError((e){
        store.dispatch(RefreshCommentChildrenFailedAction(parentId: action.parentId));
        throw e;
      });
  }
  next(action);
}
//children
