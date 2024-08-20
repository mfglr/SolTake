import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class CommentEntityState extends EntityState<CommentState>{
  const CommentEntityState({required super.entities});

  CommentEntityState getNextPageLikes(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.getNextPageLikes()));
  CommentEntityState addNextPageLikes(int commentId, Iterable<int> nextIds)
    => CommentEntityState(entities: updateOne(entities[commentId]!.addNextPageLikes(nextIds)));
  CommentEntityState like(int commentId, int userId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.like(userId)));
  CommentEntityState dislike(int commentId, int userId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.dislike(userId)));
  
  CommentEntityState getNextPageReplies(int commentId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.getNextPageReplies()));
  CommentEntityState addNextPageReplies(int commentId,Iterable<int> replyIds)
    => CommentEntityState(entities: updateOne(entities[commentId]!.addNextPageReplies(replyIds)));
  CommentEntityState addReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.appendReply(replyId)));
  CommentEntityState removeReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.removeReply(replyId)));
  
  CommentEntityState changeVisibility(int commentId,bool visibility)
    => CommentEntityState(entities: updateOne(entities[commentId]!.changeVisibility(visibility)));
}