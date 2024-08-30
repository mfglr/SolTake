import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class CommentEntityState extends EntityState<CommentState>{
  const CommentEntityState({required super.containers});

  CommentEntityState getNextPageLikes(int commentId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.getNextPageLikes()));
  CommentEntityState addNextPageLikes(int commentId, Iterable<int> likes)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.addNextPageLikes(likes)));
  CommentEntityState like(int commentId, int likeId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.like(likeId)));
  CommentEntityState dislike(int commentId, int likeId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.dislike(likeId)));
  
  CommentEntityState getNextPageReplies(int commentId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.getNextPageReplies()));
  CommentEntityState addNextPageReplies(int commentId,Iterable<int> replyIds)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.addNextPageReplies(replyIds)));
  CommentEntityState addReply(int commentId, int replyId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.appendReply(replyId)));
  CommentEntityState removeReply(int commentId, int replyId)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.removeReply(replyId)));
  
  CommentEntityState changeVisibility(int commentId,bool visibility)
    => CommentEntityState(containers: updateOne(containers[commentId]?.entity.changeVisibility(visibility)));
}