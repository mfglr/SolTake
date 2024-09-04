import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
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
  late final StreamSubscription<SolutionState?> _questionConsumer;

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _questionConsumer =
      store.onChange
        .map((state) => state.solutionEntityState.entities[widget.solutionId])
        .distinct()
        .listen((solution){
          if(solution != null){
            store.dispatch(ChangeSolutionAction(solution: solution));
          }
        });
    super.initState();
  }
  
  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _questionConsumer.cancel();
    super.dispose();
  }

  Widget _buildModal(Iterable<CommentState> comments,Pagination pagination){
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
                pagination: pagination,
                comments: comments,
                parentId: widget.parentId,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(GetNextPageSolutionCommentsIfReadyAction(solutionId: widget.solutionId));
                },
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
    return StoreConnector<AppState,SolutionState?>(
      converter: (store) => store.state.solutionEntityState.entities[widget.solutionId],
      builder: (context, solution){
        if(solution == null) return const LoadingWidget();
        if(widget.parentId != null){
          return StoreConnector<AppState,CommentState?>(
            onInit: (store) => store.dispatch(LoadCommentAction(commentId: widget.parentId!)),
            converter: (store) => store.state.commentEntityState.entities[widget.parentId],
            builder: (context,comment){
              if(comment == null) return const LoadingWidget();
              return StoreConnector<AppState,Iterable<CommentState>>(
                onInit: (store) => store.dispatch(GetNextPageSolutionCommentsIfNoPageAction(solutionId: widget.solutionId)),
                converter: (store) => store.state.getFormatedSolutionComments(widget.parentId!, widget.solutionId),
                builder:(context,comments) => _buildModal(comments,solution.comments)
              );
            },
          );
        }
        return StoreConnector<AppState,Iterable<CommentState>>(
          onInit: (store) => store.dispatch(GetNextPageSolutionCommentsIfNoPageAction(solutionId: widget.solutionId)),
          converter: (store) => store.state.getSolutionComments(widget.solutionId),
          builder:(context,comments) => _buildModal(comments,solution.comments)
        );
      }
    );
  }
}