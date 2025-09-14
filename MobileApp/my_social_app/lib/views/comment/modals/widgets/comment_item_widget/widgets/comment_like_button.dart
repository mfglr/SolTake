import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_user_likes_state/actions.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/state/state.dart';

class CommentLikeButton extends StatelessWidget {
  final CommentState comment;
  const CommentLikeButton({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        if(comment.isLiked){
          store.dispatch(DislikeCommentAction(comment: comment));
        }
        else{
          store.dispatch(LikeCommentAction(comment: comment));
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        comment.isLiked ? Icons.favorite : Icons.favorite_outline,
        color: comment.isLiked ? Colors.red : null,
        size: 18,
      ),
    );
  }
}