import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_widget/pagination_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/widgets/buttons/hide_replies_button/hide_replies_button.dart';

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
  late Color? _color = Colors.black.withAlpha(75);
  Future? _future;
  bool _isChildrenVisible = false;
  
  void _changeChildrenVisibility() => setState(() => _isChildrenVisible = !_isChildrenVisible);


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
              changeChildrenVisibility: _changeChildrenVisibility,
              isChildrenVisible: _isChildrenVisible,
              replyComment: widget.replyComment,
              cancelReplying: widget.cancelReplying,
              isRoot: true,
              diameter: 45,
            ),

            if(_isChildrenVisible)
              StoreConnector<AppState,Iterable<CommentStateId>>(
                converter: (store) => selectCommentChildren(store, widget.comment.id),
                builder: (context, children) => Column(
                  children: [
                    PaginationWidget<int, CommentStateId>(
                      callback: (page, {parameters}) =>
                        CommentService()
                          .getByParentId(page,parameters: (parentId: widget.comment.id))
                          .then((comments) => comments.map((comment) => CommentStateId.map(comment))),
                      isDescending: false,
                      perPage: commentsPerPage,
                      items: children,
                      onNextSuccess: (comments){
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(NextCommentsAction(comments: comments));
                      },
                      itemBuilder: (child) => CommentHeaderWidget(
                        comment: child,
                        isRoot: false,
                        replyComment: widget.replyComment,
                        cancelReplying: widget.cancelReplying,
                        contentController: widget.contentController,
                        changeChildrenVisibility: _changeChildrenVisibility,
                        isChildrenVisible: _isChildrenVisible,
                        focusNode: widget.focusNode
                      ),
                    ),
                    if(children.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:50, top:20),
                            child: HideRepliesButton(
                              comment: widget.comment,
                              onPressed: _changeChildrenVisibility,
                            ),
                          ),
                        ],
                      ),
                  ],
                )
              ),
        
          ],
        ),
      ),
    );
  }
}
