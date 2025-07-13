import 'package:flutter/widgets.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
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
          ? questionComments
          : questionComments.updateElsePrependOne(
              comment.questionId!,
              (
                questionComments[comment.questionId] ??
                Pagination.init(commentsPerPage, true)
              ).addOne(comment)
            ),
      newSolutionComments: 
        comment.solutionId == null
          ? solutionComments
          : solutionComments.updateElsePrependOne(
              comment.solutionId!,
              (
                solutionComments[comment.solutionId] ??
                Pagination.init(commentsPerPage, true)
              ).addOne(comment)
            ),
      newChildren:
        comment.parentId == null
          ? children
          : children.updateElsePrependOne(
              comment.parentId!,
              selectChildrenFromCommentsState(this, comment.parentId!).addOne(comment)
            ),
    );

  //question comments
  CommentsState startLoadingNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.updateElsePrependOne(
        questionId,
        (questionComments[questionId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.updateOne(
        questionId,
        questionComments[questionId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newQuestionComments: questionComments.updateOne(
        questionId,
        questionComments[questionId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.updateOne(
        questionId,
        questionComments[questionId]!.startLoadingNext()
      )
    );
  //question comments

  //solution comments
  CommentsState startNextLoadingSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.updateElsePrependOne(
        solutionId,
        (solutionComments[solutionId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.updateOne(
        solutionId,
        solutionComments[solutionId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newSolutionComments: solutionComments.updateOne(
        solutionId,
        solutionComments[solutionId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.updateOne(
        solutionId,
        solutionComments[solutionId]!.startLoadingNext()
      )
    );
  //solution comments


  //children
  CommentsState startLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.updateElsePrependOne(
        parentId,
        (children[parentId] ?? Pagination.init(commentsPerPage, true)).startLoadingNext()
      )
    );
  CommentsState addNextPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.updateOne(
        parentId,
        children[parentId]!.addNextPage(comments)
      )
    );
  CommentsState refreshPageChildren(int parentId, Iterable<CommentState> comments) =>
    _optional(
      newChildren: children.updateOne(
        parentId,
        children[parentId]!.refreshPage(comments)
      )
    );
  CommentsState stopLoadingNextChildren(int parentId) =>
    _optional(
      newChildren: children.updateOne(
        parentId,
        children[parentId]!.startLoadingNext()
      )
    );
    //children
}