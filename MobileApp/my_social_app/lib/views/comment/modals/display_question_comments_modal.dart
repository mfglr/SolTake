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

class DisplayQuestionCommentsModal extends StatefulWidget {
  final int questionId;
  final int? parentId;

  const DisplayQuestionCommentsModal({
    super.key,
    required this.questionId,
    this.parentId,
  });

  @override
  State<DisplayQuestionCommentsModal> createState() => _DisplayQuestionCommentsModalState();
}

class _DisplayQuestionCommentsModalState extends State<DisplayQuestionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late int? questionId;
  CommentState? comment;

  void replyComment(CommentState comment) => setState((){
    this.comment = comment;
    _contentController.text = "@${comment.userName} ";
    questionId = null;
  });

  void cancelReplying() => setState((){
    _contentController.text = _contentController.text.replaceFirst("@${comment?.userName} ",'');
    questionId = widget.questionId;
    comment = null;
  });

  void createComment(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateCommentAction(
      content: _contentController.text,
      questionId: questionId,
      parentId: comment?.parentId,
      repliedId: comment?.id
    ));
    cancelReplying();
    _contentController.clear();
    _focusNode.unfocus();
  }

  @override
  void initState() {
    questionId = widget.questionId;
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
    return StoreConnector<AppState,Iterable<CommentState>>(
      converter: (store) => store.state.getQuestionComments(widget.questionId),
      builder:(context,comments) => SizedBox(
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
                  ),
                ],
              ),
              Expanded(
                child: StoreConnector<AppState, Iterable<CommentStateId>>(
                  converter: (store) => selectQuestionComments(store,widget.questionId),
                  builder: (context,comments) => PaginationWidget<int, CommentStateId>(
                    callback: CommentService().getByQuestionId,
                    parameters: (questionId: widget.questionId),
                    isDescending: true,
                    perPage: commentsPerPage,
                    items: comments,
                    onNextSucess: (items){
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(NextQuestionCommentsAction(comments: items));
                    },
                    onRefreshSucess: (items){
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(RefreshQuestionCommentsAction(comments: items,questionId: widget.questionId));
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
                  comment: comment,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}