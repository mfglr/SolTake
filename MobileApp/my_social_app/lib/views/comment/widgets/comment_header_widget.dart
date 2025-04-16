import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_content_widget.dart';
import 'package:my_social_app/views/comment/widgets/buttons/comment_like_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_comment_likes_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_remain_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/hide_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/reply_comment_button.dart';
import 'package:my_social_app/views/comment/widgets/comment_popup_menu.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/user_page.dart';

class CommentHeaderWidget extends StatelessWidget {
  final CommentState comment;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final bool isRoot;
  final double? diameter;
  final Color? color;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;

  const CommentHeaderWidget({
    super.key,
    required this.comment,
    required this.contentController,
    required this.focusNode,
    required this.isRoot,
    required this.replyComment,
    required this.cancelReplying,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserPage(
                        userId: comment.userId,
                        userName: null,
                      )
                    )
                  ),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserPage(
                                userId: comment.userId,
                                userName: null,
                              )
                            )
                          ),
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
        
                        if(isRoot && !comment.repliesVisibility && comment.numberOfNotDisplayedReplies > 0)
                          DisplayRepliesButton(comment: comment)
                        else if (isRoot && comment.repliesVisibility && comment.numberOfNotDisplayedReplies > 0)
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: HideRepliesButton(comment: comment)
                              ),
                              DisplayRemainRepliesButton(comment: comment),
                            ],
                          )
                        else if(isRoot && comment.repliesVisibility && comment.numberOfNotDisplayedReplies <= 0)
                          HideRepliesButton(comment: comment)
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