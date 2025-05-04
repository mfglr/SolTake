import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/widgets/buttons/hide_replies_button/hide_replies_button.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class CommentItemWidget extends StatefulWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final bool? isFocused;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;

  const CommentItemWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
    required this.replyComment,
    required this.cancelReplying,
    this.isFocused,
  });

  @override
  State<CommentItemWidget> createState() => _CommentItemWidgetState();
}

class _CommentItemWidgetState extends State<CommentItemWidget> {
  late Color? _color = Colors.black.withOpacity(0.2);
  Future? _future;

  @override
  void initState() {
    if(widget.isFocused != null && widget.isFocused!){
      _future = Future.delayed(
      const Duration(seconds: 2),
        (){
          setState(() {
            _color = ThemeData().cardTheme.color;
          });
        }
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    if(_future != null){
      _future!.ignore();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          
            CommentHeaderWidget(
              color: widget.isFocused != null && widget.isFocused! ? _color : null,
              comment: widget.comment,
              contentController: widget.contentController,
              focusNode: widget.focusNode,
              replyComment: widget.replyComment,
              cancelReplying: widget.cancelReplying,
              isRoot: true,
              diameter: 45,
            ),

            if(widget.comment.repliesVisibility)
              StoreConnector<AppState,Iterable<CommentState>>(
                converter: (store) => store.state.selectCommentReplies(widget.comment.id),
                builder: (context,replies) => Column(
                  children: [
                    if(widget.comment.children.loadingNext)
                      const LoadingCircleWidget(strokeWidth: 2),
                    ...replies.map(
                      (reply) => Padding(
                        padding: const EdgeInsets.only(left: 50,top: 20),
                        child: CommentHeaderWidget(
                          comment: reply,
                          isRoot: false,
                          replyComment: widget.replyComment,
                          cancelReplying: widget.cancelReplying,
                          contentController: widget.contentController,
                          focusNode: widget.focusNode
                        ),
                      )
                    ),
                  ]
                )
              ),
      
            if(widget.comment.repliesVisibility && widget.comment.children.values.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:50, top:20),
                    child: HideRepliesButton(comment: widget.comment),
                  ),
                ],
              ),
              
          ],
        ),
      ),
    );
  }
}
