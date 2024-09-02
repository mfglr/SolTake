import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

class CommentUserLikeEntityState extends EntityState<CommentUserLikeState>{
  const CommentUserLikeEntityState({required super.entities});

  CommentUserLikeEntityState addLikes(Iterable<CommentUserLikeState> likes)
    => CommentUserLikeEntityState(entities: appendMany(likes));
  CommentUserLikeEntityState addLike(CommentUserLikeState like)
    => CommentUserLikeEntityState(entities: appendOne(like));
  CommentUserLikeEntityState removeLike(int likeId)
    => CommentUserLikeEntityState(entities: removeOne(likeId));

  CommentUserLikeState? select(int commentId,int userId)
    => entities.values.firstWhereOrNull((x) => x.commentId == commentId && x.appUserId == userId);
}