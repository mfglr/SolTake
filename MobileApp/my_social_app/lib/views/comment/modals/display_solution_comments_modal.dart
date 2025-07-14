import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_widget/pagination_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget/no_comments_widget.dart';

class DisplaySolutionCommentsModal extends StatefulWidget {
  final int solutionId;
  final int? parentId;
  const DisplaySolutionCommentsModal({
    super.key,
    required this.solutionId, 
    this.parentId
  });

  @override
  State<DisplaySolutionCommentsModal> createState() => _DisplaySolutionCommentsModalState();
}

class _DisplaySolutionCommentsModalState extends State<DisplaySolutionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late int? _solutionId;
  CommentState? _comment;

  void createComment(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateCommentAction(
      content: _contentController.text,
      solutionId: _solutionId,
      parentId: _comment?.parentId,
      repliedId: _comment?.id
    ));
    cancelReplying();
    _contentController.clear();
    _focusNode.unfocus();
  }

  void replyComment(CommentState comment) => setState((){
    _comment = comment;
    _contentController.text = "@${comment.userName} ";
    _solutionId = null;
  });

  void cancelReplying() => setState((){
    _contentController.text = _contentController.text.replaceFirst("@${_comment?.userName} ",'');
    _solutionId = widget.solutionId;
    _comment = null;
  });
  
  @override
  void initState() {
    _solutionId = widget.solutionId;
    super.initState();
  }
  
  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: StoreConnector<AppState, Iterable<CommentStateId>>(
                converter: (store) => selectSolutionComments(store, widget.solutionId),
                builder: (context,comments) => PaginationWidget<int, CommentStateId>(
                  callback: ( page, { parameters } ) =>
                    CommentService()
                      .getBySolutionId(page,parameters: parameters)
                      .then((comments) => comments.map((comment) => CommentStateId.map(comment))),
                  parameters: (solutionId: widget.solutionId),
                  isDescending: true,
                  perPage: commentsPerPage,
                  items: comments,
                  onNextSuccess: (items){
                    final store = StoreProvider.of<AppState>(context, listen: false);
                    store.dispatch(NextCommentsAction(comments: items));
                  },
                  onRefreshSuccess: (items){
                    final store = StoreProvider.of<AppState>(context, listen: false);
                    store.dispatch(RefreshSolutionCommentsAction(comments: items, solutionId: widget.solutionId));
                  },
                  itemBuilder: (comment) => CommentItemWidget(
                    contentController: _contentController,
                    focusNode: _focusNode,
                    comment: comment,
                    replyComment: replyComment,
                    cancelReplying: cancelReplying
                  ),
                  noItems: const NoCommentsWidget()
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,20),
              child: CommentFieldWidget(
                contentController: _contentController,
                focusNode: _focusNode,
                scrollController: _scrollController,
                cancelReplying: cancelReplying,
                createComment: createComment,
                comment: _comment,
              ),
            ),
          ],
        ),
      ),
    );
  }
}