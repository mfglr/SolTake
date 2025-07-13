import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/comment/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/widgets/buttons/hide_replies_button/hide_replies_button.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:rxdart/rxdart.dart';

class CommentItemWidget extends StatefulWidget {
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final bool? isFocused;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;
  final BehaviorSubject<int> visibilitySubject;

  const CommentItemWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
    required this.replyComment,
    required this.cancelReplying,
    required this.visibilitySubject,
    this.isFocused,
  });

  @override
  State<CommentItemWidget> createState() => _CommentItemWidgetState();
}

class _CommentItemWidgetState extends State<CommentItemWidget> {
  late Color? _color = Colors.black.withOpacity(0.2);
  Future? _future;
  bool _isVisible = false;
  late final StreamSubscription<int> _visibilitySubscription;

  void changeChildrenVisibility() => setState(() =>_isVisible = !_isVisible);
  void makeVisibleChildren() => setState(() => _isVisible = true);

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

    _visibilitySubscription = widget.visibilitySubject.listen((id){
      if(id == widget.comment.id){
        makeVisibleChildren();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if(_future != null){
      _future!.ignore();
    }
    _visibilitySubscription.cancel();
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
              changeChildrenVisibility: changeChildrenVisibility,
              isVisible: _isVisible,
              isRoot: true,
              diameter: 45,
            ),
    
            if(_isVisible)
              StoreConnector<AppState, Pagination<int,CommentState>>(
                onInit: (store){
                  var pagination = selectChildren(store, widget.comment.id); 
                  getNextEntitiesIfNoPage(
                    store,
                    selectChildren(store, widget.comment.id),
                    NextCommentChildrenAction(parentId: widget.comment.id)
                  );
                },
                converter: (store) => selectChildren(store, widget.comment.id),
                builder: (context,pagination) => Column(
                  children: [
                    if(pagination.loadingNext)
                      const LoadingCircleWidget(strokeWidth: 2),
                    ...pagination.values.map(
                      (child) => Padding(
                        padding: const EdgeInsets.only(left: 50,top: 20),
                        child: CommentHeaderWidget(
                          comment: child,
                          isRoot: false,
                          replyComment: widget.replyComment,
                          cancelReplying: widget.cancelReplying,
                          contentController: widget.contentController,
                          focusNode: widget.focusNode,
                          isVisible: _isVisible,
                          changeChildrenVisibility: changeChildrenVisibility,
                        ),
                      )
                    ),
                    if(!pagination.isEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:50, top:20),
                            child: HideRepliesButton(
                              comment: widget.comment,
                              onPressed: changeChildrenVisibility,
                            ),
                          ),
                        ],
                      ),
                  ]
                ),
              ),
          ],
        ),
      ),
    );
  }
}
