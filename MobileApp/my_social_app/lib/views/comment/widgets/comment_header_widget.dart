import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/comment/widgets/comment_content_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_like_button_widget.dart';
import 'package:my_social_app/views/comment/widgets/hide_replies_button_widget.dart';
import 'package:my_social_app/views/comment/widgets/reply_comment_button_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

enum CommentsAction{
  delete
}

class CommentHeaderWidget extends StatelessWidget {
  final CommentState comment;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final Widget? displayRepliesButton;
  final double? diameter; 
  const CommentHeaderWidget({
    super.key,
    required this.comment,
    required this.contentController,
    required this.focusNode,
    this.displayRepliesButton,
    this.diameter,
  });
  @override
  Widget build(BuildContext context) {
    
    return Row(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () => 
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserPage(
                    userId: comment.appUserId,
                    userName: null,
                  )
                )
              ),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              minimumSize: WidgetStateProperty.all(const Size(0, 0)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: UserImageWidget(
              userId: comment.appUserId, 
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
                            userId: comment.appUserId,
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
              
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      timeago.format(
                        comment.createdAt,
                        locale: 'en_short'
                      ),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
              
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: StoreConnector<AppState,int>(
                      converter: (store) => store.state.accountState!.id,
                      builder: (context,accountId) => Builder(
                        builder: (context) {
                          if(comment.appUserId != accountId) return const SpaceSavingWidget();
                          return PopupMenuButton<CommentsAction>(
                            iconSize: 15,
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onSelected: (value) async {
                              switch(value){
                                case CommentsAction.delete:
                                  bool response = await DialogCreator.showDeleteCommentDialog(context);
                                  if(response && context.mounted){
                                    final store = StoreProvider.of<AppState>(context,listen: false);
                                    store.dispatch(RemoveCommentAction(comment: comment));
                                  }
                                default:
                                  return;
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem<CommentsAction>(
                                  value: CommentsAction.delete,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delete"),
                                      Icon(Icons.delete)
                                    ],
                                  )
                                )
                              ];
                            }
                          );
                        }
                      ),
                    ),
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
                      child: ReplyCommentButtonWidget(
                        contentController: contentController,
                        focusNode: focusNode,
                        comment: comment,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if(displayRepliesButton == null || comment.numberOfReplies == 0) return const SpaceSavingWidget();
                        if(comment.repliesVisibility) return HideRepliesButtonWidget(comment: comment);
                        return displayRepliesButton!; 
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
            CommentLikeButtonWidget(
              comment: comment,
            ),
          ],
        ),
    
      ],
    );
      
  }
}