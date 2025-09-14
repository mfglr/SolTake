import 'package:flutter/cupertino.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/packages/entity_state/entity_collection.dart';
import 'package:my_social_app/packages/entity_state/key_pagination.dart';
import 'package:my_social_app/packages/entity_state/map_extentions.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';

@immutable
class CommentsState {
  final EntityCollection<int, CommentState> comments;
  final Map<int, KeyPagination<int>> questionComments;
  final Map<int, KeyPagination<int>> solutionComments;
  final Map<int, KeyPagination<int>> commentComments;
  
  const CommentsState({
    required this.comments,
    required this.questionComments,
    required this.solutionComments,
    required this.commentComments
  });

  CommentsState _optional({
    final EntityCollection<int, CommentState>? newComments,
    final Map<int, KeyPagination<int>>? newQuestionComments,
    final Map<int, KeyPagination<int>>? newSolutionComments,
    final Map<int, KeyPagination<int>>? newCommentComments 
  }) =>
    CommentsState(
      comments: newComments ?? comments,
      questionComments: newQuestionComments ?? questionComments,
      solutionComments: newSolutionComments ?? solutionComments,
      commentComments: newCommentComments ?? commentComments
    );

  //selectors
  KeyPagination<int> _selectQuestionCommentsKeyPagination(int questionId) =>
    questionComments[questionId] ?? KeyPagination<int>.init(commentsPerPage, true);
  KeyPagination<int> _selectSolutionCommentsKeyPagination(int solutionId) =>
    solutionComments[solutionId] ?? KeyPagination<int>.init(commentsPerPage, true);
  KeyPagination<int> _selectCommentCommentsKeyPagination(int commentId) =>
    commentComments[commentId] ?? KeyPagination<int>.init(commentsPerPage, true);
  
  Pagination<int, CommentState> selectQuestionComments(int questionId) =>
    Pagination.fromCollection(comments, _selectQuestionCommentsKeyPagination(questionId));
  Pagination<int, CommentState> selectSolutionComments(int solutionId) =>
    Pagination.fromCollection(comments, _selectSolutionCommentsKeyPagination(solutionId));
  Pagination<int, CommentState> selectCommentComments(int commentId) =>
    Pagination.fromCollection(comments, _selectCommentCommentsKeyPagination(commentId));

  int selectNumberOfNotDisplayedCommentComments(bool isVisible, CommentState comment) =>
    comment.numberOfChildren - (isVisible ? commentComments[comment.id]?.keys.length ?? 0 : 0);
  //selectors

  CommentsState create(CommentState comment) =>
    _optional(
      newComments: 
        comment.parentId == null 
          ? comments.loadSuccess(comment.id, comment)
          : comments
              .loadSuccess(comment.id, comment)
              .update(comment.parentId!, comments[comment.parentId!].entity?.increaseNumberOfChildren()),
      newQuestionComments: 
        comment.questionId != null
          ? questionComments.setOne(
              comment.questionId!,
              _selectQuestionCommentsKeyPagination(comment.questionId!).addOne(comment.id)
            ) 
          : questionComments,
      newSolutionComments:
        comment.solutionId != null
          ? solutionComments.setOne(
              comment.solutionId!,
              _selectSolutionCommentsKeyPagination(comment.solutionId!).addOne(comment.id)
            )
          : solutionComments,
        newCommentComments:
          comment.parentId != null
            ? commentComments.setOne(
                comment.parentId!,
                _selectCommentCommentsKeyPagination(comment.parentId!).addOne(comment.id)
              )
            : commentComments
    );

  CommentsState delete(CommentState comment) =>
    _optional(
      newComments:
        comment.parentId == null
          ? comments.remove(comment.id)
          : comments
              .remove(comment.id)
              .update(comment.parentId!, comments[comment.parentId!].entity?.decreaseNumberOfChildren()),
      newQuestionComments: comment.questionId != null
        ? questionComments.setOne(
            comment.questionId!,
            questionComments[comment.questionId]?.removeOne(comment.id)
          )
        : questionComments,
      newSolutionComments: comment.solutionId != null
        ? solutionComments.setOne(
            comment.solutionId!,
            solutionComments[comment.solutionId]?.removeOne(comment.id)
          )
        : solutionComments,
      newCommentComments: comment.parentId != null
        ? commentComments.setOne(
            comment.parentId!,
            commentComments[comment.parentId]?.removeOne(comment.id)
          )
        : commentComments,
    );

  CommentsState like(CommentState comment) =>
    _optional(newComments: comments.update(comment.id, comment.like()));
  
  CommentsState dislike(CommentState comment) =>
    _optional(newComments: comments.update(comment.id, comment.dislike()));

  //question comments
  CommentsState startNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        _selectQuestionCommentsKeyPagination(questionId).startNext()
      )
    );
  CommentsState addNextQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newQuestionComments: questionComments.setOne(
        questionId,
        _selectQuestionCommentsKeyPagination(questionId).addNext(comments.map((e) => e.id))
      )
    );
  CommentsState refresQuestionComments(int questionId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newQuestionComments: questionComments.setOne(
        questionId,
        _selectQuestionCommentsKeyPagination(questionId).refresh(comments.map((e) => e.id))
      )
    );
  CommentsState stopNextQuestionComments(int questionId) =>
    _optional(
      newQuestionComments: questionComments.setOne(
        questionId,
        _selectQuestionCommentsKeyPagination(questionId).stopNext()
      )
    );
  //question comments;

  //solution comments
  CommentsState startNextSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        _selectSolutionCommentsKeyPagination(solutionId).startNext()
      )
    );
  CommentsState addNextSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newSolutionComments: solutionComments.setOne(
        solutionId,
        _selectSolutionCommentsKeyPagination(solutionId).addNext(comments.map((e) => e.id))
      )
    );
  CommentsState refresSolutionComments(int solutionId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newSolutionComments: solutionComments.setOne(
        solutionId,
        _selectSolutionCommentsKeyPagination(solutionId).refresh(comments.map((e) => e.id))
      )
    );
  CommentsState stopNextSolutionComments(int solutionId) =>
    _optional(
      newSolutionComments: solutionComments.setOne(
        solutionId,
        _selectSolutionCommentsKeyPagination(solutionId).stopNext()
      )
    );
  //solution comments

  //comment comments
  CommentsState startNextCommentComments(int commentId) =>
    _optional(
      newCommentComments: commentComments.setOne(
        commentId,
        _selectCommentCommentsKeyPagination(commentId).startNext()
      )
    );
  CommentsState addNextCommentComments(int commentId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newCommentComments: commentComments.setOne(
        commentId,
        _selectCommentCommentsKeyPagination(commentId).addNext(comments.map((e) => e.id))
      )
    );
  CommentsState refresCommentComments(int commentId, Iterable<CommentState> comments) =>
    _optional(
      newComments: this.comments.loadSuccessMany({for (var comment in comments) comment.id : comment}),
      newCommentComments: commentComments.setOne(
        commentId,
        _selectCommentCommentsKeyPagination(commentId).refresh(comments.map((e) => e.id))
      )
    );
  CommentsState stopNextCommentComments(int commentId) =>
    _optional(
      newCommentComments: commentComments.setOne(
        commentId,
        _selectCommentCommentsKeyPagination(commentId).stopNext()
      )
    );
  //comment comments

}