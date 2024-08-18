import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';

class DisplaySolutionCommentsModal extends StatefulWidget {
  final int solutionId;
  const DisplaySolutionCommentsModal({super.key,required this.solutionId});

  @override
  State<DisplaySolutionCommentsModal> createState() => _DisplaySolutionCommentsModalState();
}

class _DisplaySolutionCommentsModalState extends State<DisplaySolutionCommentsModal> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3.50 / 4,
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
              child: SingleChildScrollView(
                controller: _scrollController,
                child: StoreConnector<AppState,Iterable<CommentState>>(
                  onInit:(store) => store.dispatch(GetNextPageSolutionCommentsIfNoPageAction(solutionId: widget.solutionId)),
                  converter: (store) => store.state.getSolutionComments(widget.solutionId),
                  builder: (context,comments) => StoreConnector<AppState,SolutionState>(
                    converter: (store) => store.state.solutionEntityState.entities[widget.solutionId]!,
                    builder: (context,solution) => CommentItemsWidget(
                      scrollController: _scrollController,
                      contentController: _contentController,
                      focusNode: _focusNode,
                      noItems: const NoCommentsWidget(),
                      pagination: solution.comments,
                      comments: comments,
                      onScrollBottom: (){
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(GetNextPageSolutionCommentsAction(solutionId: widget.solutionId));
                      },
                  )
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,25),
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
}