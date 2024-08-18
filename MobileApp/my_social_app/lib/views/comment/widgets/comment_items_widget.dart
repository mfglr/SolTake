import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget.dart';

class CommentItemsWidget extends StatefulWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final Iterable<CommentState> comments;
  final int offset;

  const CommentItemsWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comments,
    required this.offset
  });

  @override
  State<CommentItemsWidget> createState() => _CommentItemsWidgetState();
}

class _CommentItemsWidgetState extends State<CommentItemsWidget> {
  Color? _colorOfFocudComment = Colors.black.withOpacity(0.1);
  late final Future future;

  @override
  void initState() {
    future = Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        _colorOfFocudComment = Theme.of(context).cardTheme.color;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    future.ignore();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.comments.length,
        (index){
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: CommentItemWidget(
              color: widget.comments.elementAt(index).id == widget.offset ? _colorOfFocudComment : null,
              contentController: widget.contentController,
              focusNode: widget.focusNode,
              comment: widget.comments.elementAt(index)
            )
          );
        }
      ),
    );
  }
}