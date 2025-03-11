import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class CommentUserLikeWidget extends StatelessWidget {
  final CommentUserLikeState commentUserLike;
  const CommentUserLikeWidget({
    super.key,
    required this.commentUserLike
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => UserPage(userId: commentUserLike.userId))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: AppAvatar(
                    avatar: commentUserLike,
                    diameter: 55
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      compressText(commentUserLike.userName, 20),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    if(commentUserLike.name != null)
                      Text(
                        compressText(commentUserLike.name!, 20),
                        style: const TextStyle(
                          fontSize: 13
                        ),
                      )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}