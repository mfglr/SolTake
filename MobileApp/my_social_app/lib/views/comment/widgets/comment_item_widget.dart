import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/widgets/display_remain_replies_button_widget.dart';
import 'package:my_social_app/views/comment/widgets/display_replies_button_widget.dart';
import 'package:my_social_app/views/comment/widgets/hide_replies_button_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class CommentItemWidget extends StatefulWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final bool? isFocused;

  const CommentItemWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
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
      color: widget.isFocused != null && widget.isFocused! ? _color : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            CommentHeaderWidget(
              comment: widget.comment,
              contentController: widget.contentController,
              focusNode: widget.focusNode,
              displayRepliesButton: DisplayRepliesButtonWidget(comment: widget.comment),
              diameter: 45,
            ),
      
            Builder(
              builder: (context) {
                if(!widget.comment.repliesVisibility) return const SpaceSavingWidget();
                return StoreConnector<AppState,Iterable<CommentState>>(
                  converter: (store) => store.state.selectCommentReplies(widget.comment.id),
                  builder: (context,replies) => Column(
                    children: [
                      ...replies.map(
                        (reply) => Padding(
                          padding: const EdgeInsets.only(left: 50,top: 20),
                          child: CommentHeaderWidget(
                            comment: reply,
                            contentController: widget.contentController,
                            focusNode: widget.focusNode
                          ),
                        )
                      ),
                      Builder(
                        builder: (context){
                          if(widget.comment.replies.loadingNext){
                            return const LoadingCircleWidget(strokeWidth: 2);
                          }
                          return const SpaceSavingWidget();
                        }
                      )
                    ]
                  )
                );
              }
            ),
      
            Builder(
              builder: (context) {
                if(!widget.comment.repliesVisibility) return const SpaceSavingWidget();
                return Row(
                  children: [
                    
                    Builder(
                      builder: (context){
                        if(widget.comment.replies.ids.isNotEmpty){
                          return Padding(
                            padding: const EdgeInsets.only(left:50, top:20, right: 20),
                            child: HideRepliesButtonWidget(comment: widget.comment),
                          );
                        }
                        return const SpaceSavingWidget();
                      }
                    ),
                
                    Builder(
                      builder: (context){
                        if(widget.comment.numberOfNotDisplayedReplies > 0){
                          return Padding(
                            padding: const EdgeInsets.only(left:50, top:20),
                            child: DisplayRemainRepliesButtonWidget(comment: widget.comment),
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
