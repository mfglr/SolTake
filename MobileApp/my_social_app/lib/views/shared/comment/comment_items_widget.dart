import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/shared/comment/comment_item_widget.dart';

class CommentItemsWidget extends StatefulWidget {
  final Iterable<CommentState> comments;
  const CommentItemsWidget({super.key,required this.comments});

  @override
  State<CommentItemsWidget> createState() => _CommentItemsWidgetState();
}

class _CommentItemsWidgetState extends State<CommentItemsWidget> {
  
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.comments.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: CommentItemWidget(
            comment: widget.comments.elementAt(index)
          )
        )
      ),
    );
  }
}