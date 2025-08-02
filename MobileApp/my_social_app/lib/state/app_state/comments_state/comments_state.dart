import 'package:flutter/widgets.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
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

  CommentsState create(CommentState comment) =>
    _optional(
      newQuestionComments: 
        comment.questionId == null
          ? parent == null
              ? questionComments
              : questionComments.setOne(
                  comment.questionId!,
                  selectQuestionCommentsFromState(this,comment.questionId!).updateOne(parent.increaseNumberOfChildren())
                )
          : questionComments.setOne(
              comment.questionId!,
              parent != null
                ? selectQuestionCommentsFromState(this,comment.questionId!)
                    .addOne(comment)
                : selectQuestionCommentsFromState(this,comment.questionId!)
                    .addOne(comment)
                    .updateOne(parent!.increaseNumberOfChildren())
            ),
      newSolutionComments: 
        comment.solutionId == null
          ? solutionComments
          : solutionComments.setOne(
              comment.solutionId!,
              parent != null
                ? selectQuestionCommentsFromState(this, comment.solutionId!)
                    .addOne(comment)
                : selectQuestionCommentsFromState(this, comment.solutionId!)
                    .addOne(comment)
                    .updateOne(parent!.increaseNumberOfChildren())
            ),
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
        (questionComments[questionId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        questionComments[questionId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        questionComments[questionId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        questionComments[questionId]!.startLoadingNext()
      )
    );
  //question comments

  //solution comments
  CommentsState startNextLoadingSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        (solutionComments[solutionId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        solutionComments[solutionId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        solutionComments[solutionId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        solutionComments[solutionId]!.startLoadingNext()
      )
    );
  //solution comments


  //children
  CommentsState startLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        (children[parentId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        children[parentId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        children[parentId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.setOne(
        parentId,
        children[parentId]!.startLoadingNext()
      )
    );
    //children
}