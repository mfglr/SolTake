import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget/widgets/comment_content_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget/widgets/comment_like_button.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget/widgets/display_comment_likes_button/display_comment_likes_button.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget/widgets/reply_comment_button/reply_comment_button.dart';
import 'package:my_social_app/views/comment/widgets/comment_popup_menu/comment_popup_menu.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';

class CommentHeaderWidget extends StatelessWidget {
  final CommentState comment;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final Widget? child;
  final double? diameter;
  final Color? color;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;
  final void Function() changeChildrenVisibility;
  final bool isVisible;

  const CommentHeaderWidget({
    super.key,
    required this.comment,
    required this.contentController,
    required this.focusNode,
    required this.replyComment,
    required this.cancelReplying,
    required this.changeChildrenVisibility,
    required this.isVisible,
    this.child,
    this.diameter,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => 
                  Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) => UserPageById(userId: comment.userId))),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: AppAvatar(
                  avatar: comment, 
                  diameter: diameter ?? 35
                ),
              ),
            ),
        
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () =>
                          Navigator
                            .of(context)
                            .push(MaterialPageRoute(builder: (context) => UserPageById(userId: comment.userId))),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          comment.userName,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                      if(comment.numberOfLikes > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: DisplayCommentLikesButton(comment: comment)
                        ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: AppDateWidget(
                          dateTime: comment.createdAt,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      if(comment.isOwner)
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: CommentPopupMenu(comment: comment)
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CommentContentWidget(
                      comment: comment
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: ReplyCommentButton(
                            contentController: contentController,
                            focusNode: focusNode,
                            comment: comment,
                            cancelReplying: cancelReplying,
                            replyComment: replyComment,
                          ),
                        ),
                        if(child != null)
                          child!
                      ],
                    ),
                  ),
                ],
              ),
            ),
        
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommentLikeButton(comment: comment,),
              ],
            ),
          ],
        ),
      ),
    );
      
  }
}