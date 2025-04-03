import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

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

  Widget _buildModal(Iterable<CommentState> comments,QuestionState question){
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
                  onPressed: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    store.dispatch(ClearQuestionCommentsAction(questionId: widget.questionId));
                    getNextEntitiesIfReady(
                      store,
                      selectQuestionCommentsPagination(store, widget.questionId),
                      NextQuestionCommentsAction(questionId: widget.questionId)
                    );
                  },
                  icon: const Icon(Icons.refresh)
                ),
                IconButton(
                  onPressed: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    getPrevEntitiesIfReady(
                      store,
                      selectQuestionCommentsPagination(store, widget.questionId),
                      PrevQuestionCommentsAction(questionId: widget.questionId)
                    );
                  },
                  icon: const Icon(Icons.arrow_upward_rounded)
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
                noItems: const NoCommentsWidget(),
                pagination: question.comments,
                comments: comments,
                parentId: widget.parentId,
                cancelReplying: cancelReplying,
                replyComment: replyComment,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  getNextPageIfReady(store, question.comments, NextQuestionCommentsAction(questionId: widget.questionId));
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
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => getNextPageIfNoPage(
        store,
        selectQuestionCommentsPagination(store, widget.questionId),
        NextQuestionCommentsAction(questionId: widget.questionId)
      ),
      converter: (store) => selectQuestion(store, widget.questionId),
      builder: (context, question){
        if(question == null) return const LoadingWidget();
        
        // if(widget.parentId != null){
        //   return StoreConnector<AppState,CommentState?>(
        //     onInit: (store) => store.dispatch(LoadCommentAction(commentId: widget.parentId!)),
        //     converter: (store) => store.state.commentEntityState.getValue(widget.parentId!),
        //     builder: (context,parent){
              
        //       if(parent == null){
        //         return StoreConnector<AppState,Iterable<CommentState>>(
        //           onInit: (store) => getNextPageIfNoPage(
        //             store,
        //             question.comments,
        //             NextQuestionCommentsAction(questionId: widget.questionId)
        //           ),
        //           converter: (store) => store.state.getQuestionComments(widget.questionId),
        //           builder:(context,comments) => _buildModal(comments,question)
        //         );
        //       }

        //       return StoreConnector<AppState,Iterable<CommentState>>(
        //         onInit: (store) => getNextPageIfNoPage(
        //           store,
        //           question.comments,
        //           NextQuestionCommentsAction(questionId: widget.questionId)
        //         ),
        //         converter: (store) => store.state.getFormatedQuestionComments(widget.parentId!, widget.questionId),
        //         builder:(context,comments) => _buildModal(comments,question)
        //       );
              
        //     },
        //   );
        // }
        return StoreConnector<AppState,Iterable<CommentState>>(
          converter: (store) => store.state.getQuestionComments(widget.questionId),
          builder:(context,comments) => _buildModal(comments,question)
        );
      }
    );
  }
}