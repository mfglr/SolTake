import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget/no_comments_widget.dart';
import 'package:rxdart/rxdart.dart';

class DisplayQuestionCommentsModal extends StatefulWidget {
  final QuestionState question;
  final int? parentId;

  const DisplayQuestionCommentsModal({
    super.key,
    required this.question,
    this.parentId,
  });

  @override
  State<DisplayQuestionCommentsModal> createState() => _DisplayQuestionCommentsModalState();
}

class _DisplayQuestionCommentsModalState extends State<DisplayQuestionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late QuestionState? _question;
  CommentState? _parent;
  CommentState? _replied;
  final _visibilitySubject = BehaviorSubject<int>();

  void replyComment(CommentState replied) => setState((){
    final store = StoreProvider.of<AppState>(context,listen: false);
    _parent = replied.parentId == null ? replied : selectQuestionComment(store, widget.question.id, replied.parentId!);
    _replied = replied;
    _contentController.text = "@${replied.userName} ";
    _question = null;
  });

  void cancelReplying() => setState((){
    _contentController.text = _contentController.text.replaceFirst("@${_replied?.userName} ",'');
    _question = widget.question;
    _parent = null;
    _replied = null;
  });

  void createComment(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateCommentAction(
      content: _contentController.text,
      question: _question,
      solution: null,
      parent: _parent,
      replied: _replied
    ));
    if(_replied != null){
      _visibilitySubject.add(_replied!.id);
      cancelReplying();
    }
    _contentController.clear();
    _focusNode.unfocus();
  }

  @override
  void initState() {
    _question = widget.question;
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
          selectQuestionComments(store, widget.question.id),
          NextQuestionCommentsAction(questionId: widget.question.id)
        ),
      converter: (store) => selectQuestionComments(store, widget.question.id),
      builder: (context, pagination) => SizedBox(
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
                    onPressed: (){
                      final store = StoreProvider.of<AppState>(context, listen: false);
                      refreshEntities(
                        store,
                        selectQuestionComments(store, widget.question.id),
                        RefreshQuestionCommentsAction(questionId: widget.question.id)
                      );
                    },
                    icon: const Icon(Icons.refresh)
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close)
                  ),
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
                      selectQuestionComments(store, widget.question.id),
                      NextQuestionCommentsAction(questionId: widget.question.id)
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