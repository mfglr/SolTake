import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void createCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateCommentAction){
    CommentService()
      .createComment(action.content, action.questionId, action.solutionId, action.repliedId)
      .then((comment) => store.dispatch(CreateCommentSuccessAction(
        questionId: action.questionId,
        solutionId: action.solutionId,
        repliedId: action.repliedId,
        parentId: action.parentId,
        comment: CommentStateId.map(comment)
      )));
  }
  next(action);
}