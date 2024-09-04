import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class CommentItemsWidget extends StatefulWidget {
  final ScrollController scrollController;
  final TextEditingController contentController;
  final FocusNode focusNode;
  final Iterable<CommentState> comments;
  final Widget noItems;
  final void Function() onScrollBottom;
  final Pagination pagination;
  final int? parentId;

  const CommentItemsWidget({
    super.key,
    required this.scrollController,
    required this.contentController,
    required this.focusNode,
    required this.comments,
    required this.pagination,
    required this.noItems,
    required this.onScrollBottom,
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
          if(widget.pagination.isLast && widget.pagination.ids.isEmpty) return widget.noItems;
          return Column(
            children: [
              ...List.generate(
                widget.comments.length,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: CommentItemWidget(
                    isFocused: widget.comments.elementAt(index).id == widget.parentId ? true : false,
                    contentController: widget.contentController,
                    focusNode: widget.focusNode,
                    comment: widget.comments.elementAt(index)
                  )
                )
              ),
              Builder(
                builder: (context){
                  if(widget.pagination.loadingNext){
                    return const LoadingCircleWidget(strokeWidth: 3);
                  }
                  return const SpaceSavingWidget();
                }
              )
            ]
          );
        }
      ),
    );
  }
}