import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_item_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:redux/redux.dart';

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
  late int? questionId;
  CommentState? comment;
  
  final ScrollController _scrollController = ScrollController();
  bool _loadingNext = false;
  bool _isLast = false;
  bool get _isReadyForNext => !_loadingNext && !_isLast;
  
  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      _next(store);
    }
  );

  void _nextX(Store<AppState> store){
    setState(() => _loadingNext = true);
    final page = selectQuestionCommentsNextPage(store, widget.questionId);
    CommentService()
      .getCommentsByQuestionId(widget.questionId, page)
      .then((comments){
        store.dispatch(AddNextCommentsAction(comments: comments.map((e) => e.toCommentState())));
        setState((){
          _isLast = comments.length < commentsPerPage;
          _loadingNext = false;
        }); 
      })
      .catchError((e){
        setState(() => _loadingNext = false);
        throw e;
      });
  }

  void _next(Store<AppState> store){
    if(_isReadyForNext) _nextX(store);
  }
  void _refresh(Store<AppState> store){
    if(!_loadingNext){
      final page = selectQuestionCommentsFirstPage;
      setState(() => _loadingNext = true);
      CommentService()
        .getCommentsByQuestionId(widget.questionId, page)
        .then((comments){
          store.dispatch(RefreshCommentsAction(questionId: widget.questionId, comments: comments.map((e) => e.toCommentState())));
          setState((){
            _isLast = comments.length < commentsPerPage;
            _loadingNext = false;
          }); 
        })
        .catchError((e){
          setState(() => _loadingNext = false);
          throw e;
        });
    }
  }
  void _nextIfNoPage(Store<AppState> store){
    if(_isReadyForNext && selectQuestionComments(store, widget.questionId).length < commentsPerPage){
      _nextX(store);
    }
  }

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
      repliedId: comment?.id
    ));
    cancelReplying();
    _contentController.clear();
    _focusNode.unfocus();
  }

  @override
  void initState() {
    questionId = widget.questionId;
    _scrollController.addListener(_onScrollBottom);
    final store = StoreProvider.of<AppState>(context,listen: false);
    _nextIfNoPage(store);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    _contentController.dispose();
    _focusNode.dispose();
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
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    StoreConnector<AppState, Iterable<CommentState>>(
                      converter: (store) => selectQuestionComments(store, widget.questionId),
                      builder: (context, comments) => Column(
                        children: [
                          if(comments.isEmpty && _isLast)
                            const NoCommentsWidget()
                          else
                            ...List.generate(
                              comments.length,
                              (index) => Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: CommentItemWidget(
                                  isFocused: comments.elementAt(index).id == widget.parentId ? true : false,
                                  contentController: _contentController,
                                  focusNode: _focusNode,
                                  comment: comments.elementAt(index),
                                  cancelReplying: cancelReplying,
                                  replyComment: replyComment,
                                )
                              )
                            ),
                        ],
                      )
                    ),
                    if(_loadingNext)
                      const LoadingCircleWidget()
                  ]
                ),
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
}