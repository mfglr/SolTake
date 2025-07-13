import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class AddNextCommentsAction extends AppAction{
  final Iterable<CommentState> comments;
  const AddNextCommentsAction({
    required this.comments
  });
}

@immutable
class RefreshCommentsAction extends AppAction{
  final int questionId;
  final Iterable<CommentState> comments;
  const RefreshCommentsAction({
    required this.questionId,
    required this.comments
  });
}