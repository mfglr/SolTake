import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_content_widget.dart';
import 'package:my_social_app/views/comment/widgets/buttons/comment_like_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_comment_likes_button/display_comment_likes_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_remain_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/display_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/hide_replies_button/hide_replies_button.dart';
import 'package:my_social_app/views/comment/widgets/buttons/reply_comment_button/reply_comment_button.dart';
import 'package:my_social_app/views/comment/widgets/comment_popup_menu/comment_popup_menu.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page/user_page.dart';

class CommentHeaderWidget extends StatelessWidget {
  final CommentState comment;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final bool isRoot;
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
    required this.isRoot,
    required this.replyComment,
    required this.cancelReplying,
    required this.changeChildrenVisibility,
    required this.isVisible,
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
                        if(isRoot)
                          StoreConnector<AppState, int>(
                            converter: (store) => selectNumberOfNotDisplayedReplies(store, isVisible, comment),
                            builder: (context, numberOfNotDisplayedReplies){
                              if(!isVisible && numberOfNotDisplayedReplies > 0){
                                return DisplayRepliesButton(
                                  comment: comment,
                                  isVisible: isVisible,
                                  onPressed: changeChildrenVisibility,
                                );
                              }
                              else if (isVisible && numberOfNotDisplayedReplies > 0){
                                return Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: HideRepliesButton(
                                        comment: comment,
                                        onPressed: changeChildrenVisibility,
                                      )
                                    ),
                                    DisplayRemainRepliesButton(
                                      comment: comment,
                                      isVisible: isVisible,
                                    ),
                                  ],
                                );
                              }
                              else if(isVisible && numberOfNotDisplayedReplies <= 0){
                                return HideRepliesButton(
                                  comment: comment,
                                  onPressed: changeChildrenVisibility,
                                );
                              }
                              return const SpaceSavingWidget();/////////
                            }
                          )
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