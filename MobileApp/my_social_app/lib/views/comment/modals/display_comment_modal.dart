import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayCommentsModal extends StatefulWidget {
  final Iterable<CommentState> comments;
  final Pagination pagination;
  final int? parentId;
  final void Function() onScrollBottom;

  const DisplayCommentsModal({
    super.key,
    required this.onScrollBottom,
    required this.comments,
    required this.pagination,
    this.parentId,
  });

  @override
  State<DisplayCommentsModal> createState() => _DisplayCommentsModalState();
}

class _DisplayCommentsModalState extends State<DisplayCommentsModal> {
  
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(const ClearCreateCommentStateAction());
    super.initState();
  }

  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildModal(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3 / 4,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close)
                )
              ],
            ),
            Expanded(
              child: CommentItemsWidget(
                scrollController: _scrollController,
                contentController: _contentController,
                focusNode: _focusNode,
                noItems: const NoCommentsWidget(),
                pagination: widget.pagination,
                comments: widget.comments,
                parentId: widget.parentId,
                onScrollBottom: widget.onScrollBottom,
              )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,20),
              child: StoreConnector<AppState,CreateCommentState>(
                converter: (store) => store.state.createCommentState,
                builder: (context,state) => CommentFieldWidget(
                  state: state,
                  contentController: _contentController,
                  focusNode: _focusNode,
                  scrollController: _scrollController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final parentId = widget.parentId;
    if(parentId == null) return _buildModal();
    return StoreConnector<AppState,CommentState?>(
      onInit: (store) => store.dispatch(LoadCommentAction(commentId: parentId)),
      converter: (store) => store.state.commentEntityState.entities[parentId],
      builder: (context,comment){
        if(comment == null) return const LoadingWidget();
        return _buildModal();
      },
    );
  }
  
}