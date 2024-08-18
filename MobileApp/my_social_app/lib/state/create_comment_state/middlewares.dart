import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/multi_pagination.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void createCommentMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateCommentAction){
    final state = store.state.createCommentState;
    final questionId = state.comment != null ? null : state.question?.id;
    final solutionId = state.comment != null ? null : state.solution?.id;
    final parentId = state.isRoot ? state.comment?.id : state.comment?.parentId;

    CommentService()
      .createComment(state.content,questionId,solutionId,parentId)
      .then((comment){
        store.dispatch(
          AddCommentAction(
            comment: comment.toCommentState()
          )
        );

        if(questionId != null){
          store.dispatch(
            AddQuestionCommentAction(
              offset: MultiPagination.defaultPaginationOffset,
              questionId: state.question!.id,
              commenId: comment.id
            )
          );
        }
        else if(solutionId != null){
           store.dispatch(
            AddSolutionCommentAction(
              solutionId: state.solution!.id,
              commentId: comment.id
            )
          );
        }
        else if(parentId != null){
          store.dispatch(AddCommentReplyAction(
            commentId: parentId,
            replyId: comment.id
          ));
        }
        store.dispatch(const CreateCommentSuccessAction());
      });
  }
  next(action);
}