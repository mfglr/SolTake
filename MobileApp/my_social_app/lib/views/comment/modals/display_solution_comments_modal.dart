import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

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
  late int? solutionId;
  CommentState? comment;

  void createComment(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateCommentAction(
      content: _contentController.text,
      solutionId: solutionId,
      repliedId: comment?.id
    ));
    cancelReplying();
    _contentController.clear();
    _focusNode.unfocus();
  }

  void replyComment(CommentState comment) => setState((){
    this.comment = comment;
    _contentController.text = "@${comment.userName} ";
    solutionId = null;
  });

  void cancelReplying() => setState((){
    _contentController.text = _contentController.text.replaceFirst("@${comment?.userName} ",'');
    solutionId = widget.solutionId;
    comment = null;
  });
  
  @override
  void initState() {
    solutionId = widget.solutionId;
    super.initState();
  }
  
  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildModal(Iterable<CommentState> comments,SolutionState solution){
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
                pagination: solution.comments,
                comments: comments,
                parentId: widget.parentId,
                cancelReplying: cancelReplying,
                replyComment: replyComment,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  getNextPageIfReady(store,solution.comments,NextSolutionCommentsAction(solutionId: widget.solutionId));
                },
              )
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SolutionState?>(
      converter: (store) => store.state.solutionEntityState.getValue(widget.solutionId),
      builder: (context, solution){
        if(solution == null) return const LoadingWidget();
        if(widget.parentId != null){
          return StoreConnector<AppState,CommentState?>(
            onInit: (store) => store.dispatch(LoadCommentAction(commentId: widget.parentId!)),
            converter: (store) => widget.parentId != null ? store.state.commentEntityState.getValue(widget.parentId!) : null,
            builder: (context,comment){
              
              if(comment == null){
                return StoreConnector<AppState,Iterable<CommentState>>(
                  onInit: (store) => getNextPageIfNoPage(
                    store,
                    solution.comments,
                    NextSolutionCommentsAction(solutionId: widget.solutionId)
                  ),
                  converter: (store) => store.state.getSolutionComments(widget.solutionId),
                  builder:(context,comments) => _buildModal(comments,solution)
                );
              }
              
              return StoreConnector<AppState,Iterable<CommentState>>(
                onInit: (store) => getNextPageIfNoPage(store,solution.comments,NextSolutionCommentsAction(solutionId: widget.solutionId)),
                converter: (store) => store.state.getFormatedSolutionComments(widget.parentId!, widget.solutionId),
                builder:(context,comments) => _buildModal(comments,solution)
              );

            },
          );
        }
        return StoreConnector<AppState,Iterable<CommentState>>(
          onInit: (store) => getNextPageIfNoPage(store,solution.comments,NextSolutionCommentsAction(solutionId: widget.solutionId)),
          converter: (store) => store.state.getSolutionComments(widget.solutionId),
          builder:(context,comments) => _buildModal(comments,solution)
        );
      }
    );
  }
}