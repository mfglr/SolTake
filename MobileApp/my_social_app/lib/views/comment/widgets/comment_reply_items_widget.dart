import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_reply_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class CommentReplyItemsWidget extends StatelessWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState parent;
  final Iterable<CommentState> replies;
  const CommentReplyItemsWidget({
    super.key,
    required this.focusNode,
    required this.contentController,
    required this.replies,
    required this.parent
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          replies.length,
          (index) => Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: CommentReplyItemWidget(
              contentController: contentController,
              focusNode: focusNode,
              reply: replies.elementAt(index)
            )
          )
        ),
        Builder(
          builder: (context){
            if(parent.replies.loadingNext) return const LoadingCircleWidget(strokeWidth: 2);
            return const SpaceSavingWidget();
          }
        )
      ]
      
    );
  }
}