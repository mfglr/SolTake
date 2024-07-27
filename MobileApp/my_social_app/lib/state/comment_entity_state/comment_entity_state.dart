import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';

@immutable
class CommentEntityState extends EntityState<CommentState>{
  const CommentEntityState({required super.entities});

  CommentEntityState changeVisibility(int commentId,bool visibility)
    => CommentEntityState(entities: updateOne(entities[commentId]!.changeVisibility(visibility)));

  CommentEntityState like(int commentId, int userId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.like(userId)));
  
  CommentEntityState dislike(int commentId, int userId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.dislike(userId)));

  CommentEntityState addReply(int commentId, int replyId)
    => CommentEntityState(entities: updateOne(entities[commentId]!.addReply(replyId)));

  CommentEntityState nextPageReplies(int commentId,Iterable<int> replyIds)
    => CommentEntityState(entities: updateOne(entities[commentId]!.nextPageReplies(replyIds)));
}