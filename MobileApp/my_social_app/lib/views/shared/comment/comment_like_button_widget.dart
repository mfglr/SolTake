import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/store.dart';

class CommentButtonLikeWidget extends StatelessWidget {
  final CommentState comment;
  const CommentButtonLikeWidget({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(comment.isLiked){
          store.dispatch(DislikeCommentAction(questionCommentId: comment.id));
        }
        else{
          store.dispatch(LikeCommentAction(questionCommentId: comment.id));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Builder(
              builder: (context) {
                if(comment.isLiked) return const Icon(Icons.favorite,color: Colors.red,);
                return const Icon(Icons.favorite_outline_sharp);
              }
            ),
          ),
          Text(comment.numberOfLikes.toString())
        ],
      )
    );
  }
}