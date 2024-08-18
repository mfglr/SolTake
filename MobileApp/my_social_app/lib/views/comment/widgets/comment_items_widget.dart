import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/pagination.dart';
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
  final int? focusId;

  const CommentItemsWidget({
    super.key,
    required this.scrollController,
    required this.contentController,
    required this.focusNode,
    required this.comments,
    required this.pagination,
    required this.noItems,
    required this.onScrollBottom,
    this.focusId,
  });

  @override
  State<CommentItemsWidget> createState() => _CommentItemsWidgetState();
}

class _CommentItemsWidgetState extends State<CommentItemsWidget> {
  
  Color? _color = Colors.black.withOpacity(0.2);
  late final Future _future;

  void _onScrollBottom(){
    if(widget.scrollController.hasClients && widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent){
      widget.onScrollBottom();
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_onScrollBottom);
    _future = Future.delayed(
      const Duration(seconds: 2),
      (){
        setState((){
          _color = ThemeData().cardTheme.color;
        });
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollBottom);
    _future.ignore();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Builder(
        builder: (context) {
          if(widget.pagination.isLast && widget.pagination.data.isEmpty) return widget.noItems;
          return Column(
            children: [
              ...List.generate(
                widget.comments.length,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: CommentItemWidget(
                    color: widget.comments.elementAt(index).id == widget.focusId ? _color : null,
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