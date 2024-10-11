import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class CommentEntityState extends EntityState<CommentState>{
  const CommentEntityState({required super.entities});

  CommentEntityState startLoadingNextLikes(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.startLoadingNextLikes()));
  CommentEntityState stopLoadingNextLikes(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.stopLoadingNextLikes()));
  CommentEntityState addNextPageLikes(int commentId, Iterable<int> likes)
    => CommentEntityState(entities: updateOne(entities[commentId]?.addNextPageLikes(likes)));
  CommentEntityState like(int commentId, int likeId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.like(likeId)));
  CommentEntityState dislike(int commentId, int likeId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.dislike(likeId)));
  CommentEntityState addNewLike(int commentId, int likeId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.addNewLike(likeId)));

  CommentEntityState startLoadingNextReplies(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.startLoadingNextReplies()));
  CommentEntityState stopLoadingNextReplies(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.stopLoadingNextReplies()));
  CommentEntityState addNextReplies(int commentId,Iterable<int> replyIds)
    => CommentEntityState(entities: updateOne(entities[commentId]?.addNextReplies(replyIds)));
  CommentEntityState addReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.addReply(replyId)));
  CommentEntityState removeReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.removeReply(replyId)));
  CommentEntityState addNewReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]?.addNewReply(replyId)));

  CommentEntityState changeVisibility(int commentId,bool visibility)
    => CommentEntityState(entities: updateOne(entities[commentId]!.changeVisibility(visibility)));
}