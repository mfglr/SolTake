import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_like_button_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/comment/widgets/comment_content_widget.dart';
import 'package:my_social_app/views/comment/widgets/reply_comment_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentReplyItemWidget extends StatelessWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState reply;
  const CommentReplyItemWidget({
    super.key,
    required this.reply,
    required this.contentController,
    required this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: reply.appUserId,userName: null,))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: reply.appUserId, diameter: 35)
                  ),
                  Text(
                    reply.userName,
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
          child: CommentContentWidget(comment: reply),
        ),
        Row(
          children: [
            CommentLikeButtonWidget(
              comment: reply,
            ),
            ReplyCommentButtonWidget(
              contentController: contentController,
              focusNode: focusNode,
              comment: reply,
              isRoot: false
            )
          ],
        ),
      ],
    );
  }
}