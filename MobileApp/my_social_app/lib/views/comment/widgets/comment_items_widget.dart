import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget/comment_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:rxdart/rxdart.dart';

class CommentItemsWidget extends StatefulWidget {
  final ScrollController scrollController;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final Widget noItems;
  final void Function() onScrollBottom;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;
  final BehaviorSubject<int> visibilitySubject;
  final Pagination<int, CommentState> pagination;
  final num? parentId;


  const CommentItemsWidget({
    super.key,
    required this.scrollController,
    required this.contentController,
    required this.focusNode,
    required this.pagination,
    required this.noItems,
    required this.onScrollBottom,
    required this.replyComment,
    required this.cancelReplying,
    required this.visibilitySubject,
    this.parentId,
  });

  @override
  State<CommentItemsWidget> createState() => _CommentItemsWidgetState();
}

class _CommentItemsWidgetState extends State<CommentItemsWidget> {
  void _onScrollBottom(){
    if(widget.scrollController.hasClients && widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent){
      widget.onScrollBottom();
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollBottom);
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Builder(
        builder: (context) {
          if(widget.pagination.isEmpty) return widget.noItems;
          return Column(
            children: [
              if(widget.pagination.loadingPrev)
                const LoadingCircleWidget(),
              ...List.generate(
                widget.pagination.values.length,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: CommentItemWidget(
                    isFocused: widget.pagination.values.elementAt(index).id == widget.parentId ? true : false,
                    contentController: widget.contentController,
                    focusNode: widget.focusNode,
                    visibilitySubject: widget.visibilitySubject,
                    comment: widget.pagination.values.elementAt(index),
                    cancelReplying: widget.cancelReplying,
                    replyComment: widget.replyComment,
                  )
                )
              ),
              if(widget.pagination.loadingNext)
                const LoadingCircleWidget(strokeWidth: 3),
            ]
          );
        }
      ),
    );
  }
}