import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

class CommentUserLikeEntityState extends EntityState<CommentUserLikeState>{
  const CommentUserLikeEntityState({required super.containers});

  CommentUserLikeEntityState addLikes(Iterable<CommentUserLikeState> likes)
    => CommentUserLikeEntityState(containers: appendMany(likes));
  CommentUserLikeEntityState addLike(CommentUserLikeState like)
    => CommentUserLikeEntityState(containers: appendOne(like));
  CommentUserLikeEntityState removeLike(int likeId)
    => CommentUserLikeEntityState(containers: removeOne(likeId));

  CommentUserLikeState? select(int commentId,int userId)
    => containers.values.firstWhereOrNull((x) => x.entity.commentId == commentId && x.entity.appUserId == userId)?.entity;
}