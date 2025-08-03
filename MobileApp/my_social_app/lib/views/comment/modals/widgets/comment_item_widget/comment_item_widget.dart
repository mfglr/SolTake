import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_item_widget/widgets/comment_header_widget.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_item_widget/widgets/display_remain_replies_button.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_item_widget/widgets/hide_replies_button/hide_replies_button.dart';
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
        padding: const EdgeInsets.all(16),
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
              isParent: true,
              isVisible: _isVisible,
              diameter: 45,
            ),
            if(_isVisible)
              Padding(
                padding: const EdgeInsets.only(left: 53,top: 20),
                child: StoreConnector<AppState, Pagination<int,CommentState>>(
                  onInit: (store){
                    getNextEntitiesIfNoPage(
                      store,
                      selectChildren(store, widget.comment.id),
                      NextCommentChildrenAction(parentId: widget.comment.id)
                    );
                  },
                  converter: (store) => selectChildren(store, widget.comment.id),
                  builder: (context,pagination) => Column(
                    children: [
                      ...pagination.values.map(
                        (child) => Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: CommentHeaderWidget(
                            comment: child,
                            replyComment: widget.replyComment,
                            cancelReplying: widget.cancelReplying,
                            contentController: widget.contentController,
                            focusNode: widget.focusNode,
                            isVisible: _isVisible,
                            changeChildrenVisibility: changeChildrenVisibility,
                            isParent: false,
                          ),
                        ),
                      ),
                      if(pagination.loadingNext)
                        const LoadingCircleWidget(strokeWidth: 2),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: HideRepliesButton(
                                comment: widget.comment,
                                onPressed: changeChildrenVisibility,
                              ),
                            ),
                            StoreConnector<AppState,int>(
                              converter: (store) => selectNumberOfNotDisplayedChildren(store, _isVisible, widget.comment),
                              builder: (context, numberOfNotDisplayedChildren) => Column(
                                children: [
                                  if(numberOfNotDisplayedChildren > 0)
                                    DisplayRemainRepliesButton(
                                      comment: widget.comment,
                                      isVisible: _isVisible
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}