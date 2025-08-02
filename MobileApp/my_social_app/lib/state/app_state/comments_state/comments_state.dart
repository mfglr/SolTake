import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class CommentsState {
  final Map<int,Pagination<int,CommentState>> questionComments;
  final Map<int,Pagination<int,CommentState>> solutionComments;
  final Map<int,Pagination<int,CommentState>> children;

  const CommentsState({
    required this.questionComments,
    required this.solutionComments,
    required this.children
  });

  CommentsState _optional({
    Map<int,Pagination<int,CommentState>>? newQuestionComments,
    Map<int,Pagination<int,CommentState>>? newSolutionComments,
    Map<int,Pagination<int,CommentState>>? newChildren
  }) => 
    CommentsState(
      questionComments: newQuestionComments ?? questionComments,
      solutionComments: newSolutionComments ?? solutionComments,
      children: newChildren ?? children
    );

  CommentsState create(CommentState? parent, CommentState comment) =>
    _optional(
      newQuestionComments:
        comment.questionId != null
          ? questionComments.setOne(
              comment.questionId!,
              selectQuestionCommentsFromState(this,comment.questionId!).addOne(comment)
            )
          : parent?.questionId != null
            ? questionComments.setOne(
                parent!.questionId!,
                selectQuestionCommentsFromState(this,parent.questionId!).updateOne(parent.increaseNumberOfChildren())
              )
            : questionComments,
      newSolutionComments:
        comment.solutionId != null
          ? solutionComments.setOne(
              comment.solutionId!,
              selectSolutionCommentsFromState(this,comment.solutionId!).addOne(comment)
            )
          : parent?.solutionId != null
            ? solutionComments.setOne(
                parent!.solutionId!,
                selectSolutionCommentsFromState(this,parent.solutionId!).updateOne(parent.increaseNumberOfChildren())
              )
            : solutionComments,
      newChildren:
        comment.parentId == null
          ? children
          : children.setOne(
              comment.parentId!,
              selectChildrenFromCommentsState(this, comment.parentId!).addOne(comment)
            ),
    );

  //question comments
  CommentsState startLoadingNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        selectQuestionCommentsFromState(this,questionId).startLoadingNext()
      )
    );
  CommentsState addNextPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        selectQuestionCommentsFromState(this,questionId).addNextPage(comments)
      )
    );
  CommentsState refreshPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        selectQuestionCommentsFromState(this,questionId).refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        selectQuestionCommentsFromState(this,questionId).startLoadingNext()
      )
    );
  //question comments

  //solution comments
  CommentsState startNextLoadingSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        selectSolutionCommentsFromState(this,solutionId).startLoadingNext()
      )
    );
  CommentsState addNextPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        selectSolutionCommentsFromState(this,solutionId).addNextPage(comments)
      )
    );
  CommentsState refreshPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        selectSolutionCommentsFromState(this,solutionId).refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        selectSolutionCommentsFromState(this,solutionId).startLoadingNext()
      )
    );
  //solution comments

  //children
  CommentsState startLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        selectChildrenFromCommentsState(this, parentId).startLoadingNext()
      )
    );
  CommentsState addNextPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        selectChildrenFromCommentsState(this, parentId).addNextPage(comments)
      )
    );
  CommentsState refreshPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        selectChildrenFromCommentsState(this, parentId).refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        selectChildrenFromCommentsState(this, parentId).startLoadingNext()
      )
    );
    //children
}