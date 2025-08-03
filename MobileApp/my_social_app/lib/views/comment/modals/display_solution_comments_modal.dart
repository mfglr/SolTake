import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_field_widget/comment_field_widget.dart';
import 'package:my_social_app/views/comment/modals/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/modals/widgets/no_comments_widget/no_comments_widget.dart';
import 'package:rxdart/rxdart.dart';

class DisplaySolutionCommentsModal extends StatefulWidget {
  final SolutionState solution;
  final int? parentId;
  const DisplaySolutionCommentsModal({
    super.key,
    required this.solution, 
    this.parentId
  });

  @override
  State<DisplaySolutionCommentsModal> createState() => _DisplaySolutionCommentsModalState();
}

class _DisplaySolutionCommentsModalState extends State<DisplaySolutionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late SolutionState? _solution;
  CommentState? _parent;
  CommentState? _replied;
  final _visibilitySubject = BehaviorSubject<int>();

  void createComment(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateCommentAction(
      content: _contentController.text,
      solution: _solution,
      parent: _parent,
      question: null,
      replied: _replied
    ));
    if(_replied != null){
      _visibilitySubject.add(_replied!.id);
    }
    cancelReplying();
    _contentController.clear();
    _focusNode.unfocus();
  }

  void replyComment(CommentState replied) => setState((){
    final store = StoreProvider.of<AppState>(context,listen: false);
    _parent = replied.parentId == null ? replied : selectSolutionComment(store, widget.solution.id, replied.parentId!);
    _replied = replied;
    _contentController.text = "@${replied.userName} ";
    _solution = null;
  });

  void cancelReplying() => setState((){
    _contentController.text = _contentController.text.replaceFirst("@${_replied?.userName} ",'');
    _solution = widget.solution;
    _replied = null;
  });
  
  @override
  void initState() {
    _solution = widget.solution;
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
    return StoreConnector<AppState, Pagination<int, CommentState>>(
      onInit: (store) => 
        getNextEntitiesIfNoPage(
          store,
          selectSolutionComments(store, widget.solution.id),
          NextSolutionCommentsAction(solutionId: widget.solution.id)
        ),
      converter: (store) => selectSolutionComments(store, widget.solution.id),
      builder: (store, pagination) => SizedBox(
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
                  visibilitySubject: _visibilitySubject,
                  noItems: const NoCommentsWidget(),
                  pagination: pagination,
                  parentId: widget.parentId,
                  cancelReplying: cancelReplying,
                  replyComment: replyComment,
                  onScrollBottom: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    getNextPageIfReady(
                      store,
                      selectSolutionComments(store, widget.solution.id),
                      NextSolutionCommentsAction(solutionId: widget.solution.id)
                    );
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
                  comment: _replied,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}