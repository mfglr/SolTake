import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/comment_font_size.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class CommentLikeButtonWidget extends StatelessWidget {
  final CommentState comment;
  const CommentLikeButtonWidget({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
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
                if(comment.isLiked){
                  return const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: commentIconFontSize,
                  );
                }
                return const Icon(
                  Icons.favorite_outline_sharp,
                  size: commentIconFontSize,
                );
              }
            ),
          ),
          Text(
            comment.numberOfLikes.toString(),
            style: const TextStyle(
              fontSize: commentContentFontSize
            ),
          )
        ],
      )
    );
  }
}