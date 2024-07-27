import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/comment/comment_like_button_widget.dart';
import 'package:my_social_app/views/shared/comment/comment_reply_items_widget.dart';
import 'package:my_social_app/views/shared/comment/display_remain_replies_button_widget.dart';
import 'package:my_social_app/views/shared/comment/display_replies_button_widget.dart';
import 'package:my_social_app/views/shared/comment/hide_replies_button_widget.dart';
import 'package:my_social_app/views/shared/comment/reply_comment_button_widget.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentItemWidget extends StatelessWidget {
  final CommentState comment;
  const CommentItemWidget({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: comment.appUserId))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: UserImageWidget(userId: comment.appUserId, diameter: 35)
                    ),
                    Text(
                      comment.formatUserName(10),
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  timeago.format(
                    comment.createdAt,
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
              comment.content,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Row(
            children:[
              QuestionCommentButtonLikeWidget(
                comment: comment,
              ),
              Builder(
                builder: (context){
                  if(comment.numberOfReplies > 0){
                    if(!comment.repliesVisibility){
                      return DisplayRepliesButtonWidget(comment: comment);
                    }
                    return HideRepliesButtonWidget(comment: comment);
                  }
                  return const SizedBox.shrink();
                }
              ),
              ReplyCommentButtonWidget(comment: comment,)
            ]
          ),
          Builder(
            builder: (context){
              if(comment.repliesVisibility){
                return StoreConnector<AppState,Iterable<CommentState>>(
                  converter: (store) => store.state.getCommentReplies(comment.id),
                  builder: (context,replies){
                    return Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: CommentReplyItemsWidget(replies: replies,)
                    );
                  }
                );
              }
              return const SizedBox.shrink();
            }
          ),
          Builder(
            builder: (context){
              if(comment.repliesVisibility){
                return Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      HideRepliesButtonWidget(comment: comment,),
                      Builder(
                        builder: (context) {
                          if(comment.numberOfNotDisplayedReplies > 0){
                            return DisplayRemainRepliesButtonWidget(comment: comment);
                          }
                          return const SizedBox.shrink();
                        }
                      )
                    ]
                  ),
                );
              }
              return const SizedBox.shrink();
            }
          )
        ],
      ),
    );
  }
}