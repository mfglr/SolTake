import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/comment/comment_like_button_widget.dart';
import 'package:my_social_app/views/shared/comment/reply_comment_button_widget.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentReplyItemWidget extends StatelessWidget {
  final CommentState reply;
  const CommentReplyItemWidget({super.key,required this.reply});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: reply.appUserId))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: reply.appUserId, diameter: 35)
                  ),
                  Text(
                    reply.formatUserName(10),
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
           Container(
              margin: const EdgeInsets.only(right: 15),
              child: Text(
                timeago.format(
                  reply.createdAt,
                  locale: 'en_short'
                ),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ]
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5,bottom: 5),
          child: Text(
            reply.content,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        Row(
          children: [
            CommentButtonLikeWidget(
              comment: reply,
            ),
            ReplyCommentButtonWidget(comment: reply, isRoot: false)
          ],
        ),
      ],
    );
  }
}