import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/widgets/display_replies_button_widget.dart';
import 'package:my_social_app/views/comment/widgets/hide_replies_button_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';



class CommentItemWidget extends StatelessWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final Color? color;

  const CommentItemWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CommentHeaderWidget(
              comment: comment,
              contentController: contentController,
              focusNode: focusNode,
              displayRepliesButton: DisplayRepliesButtonWidget(comment: comment),
              diameter: 45,
            ),

            Builder(
              builder: (context) {
                if(!comment.repliesVisibility) return const SpaceSavingWidget();
                return StoreConnector<AppState,Iterable<CommentState>>(
                  converter: (store) => store.state.selectCommentReplies(comment.id),
                  builder: (context,replies){
                    if(replies.isEmpty) return const SpaceSavingWidget();
                    return Column(
                      children: replies.map(
                        (reply) => Padding(
                          padding: const EdgeInsets.only(left: 50,top: 20),
                          child: CommentHeaderWidget(
                            comment: reply,
                            contentController: contentController,
                            focusNode: focusNode
                          ),
                        )
                      ).toList(),
                    );
                  } 
                );
              }
            ),

            Builder(
              builder: (context) {
                if(!comment.repliesVisibility) return const SpaceSavingWidget();
                return Row(
                  children: [
                    Builder(
                      builder: (context){
                        if(comment.replies.ids.isNotEmpty){
                          return Padding(
                            padding: const EdgeInsets.only(left:50, top:20, right: 20),
                            child: HideRepliesButtonWidget(comment: comment),
                          );
                        }
                        return const SpaceSavingWidget();
                      }
                    ),
                
                    Builder(
                      builder: (context){
                        if(comment.numberOfNotDisplayedReplies > 0){
                          return Padding(
                             padding: const EdgeInsets.only(left:50, top:20),
                            child: DisplayRepliesButtonWidget(comment: comment),
                          );
                        }
                        return const SpaceSavingWidget();
                      }
                    )
                
                  ],
                );
              }
            )

          ],
        ),
      ),
    );
  }
}
