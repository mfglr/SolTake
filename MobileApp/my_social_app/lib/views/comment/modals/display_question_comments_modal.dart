 import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/widgets/comment_field_widget.dart';
import 'package:my_social_app/views/comment/widgets/comment_items_widget.dart';
import 'package:my_social_app/views/comment/widgets/no_comments_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayQuestionCommentsModal extends StatefulWidget {
  final int questionId;
  final int? displayedCommentId;

  const DisplayQuestionCommentsModal({
    super.key,
    required this.questionId,
    this.displayedCommentId
  });

  @override
  State<DisplayQuestionCommentsModal> createState() => _DisplayQuestionCommentsModalState();
}

class _DisplayQuestionCommentsModalState extends State<DisplayQuestionCommentsModal> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  late final StreamSubscription<QuestionState?> _questionConsumer;

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _questionConsumer = 
      store.onChange
        .map((state) => state.questionEntityState.entities[widget.questionId])
        .distinct()
        .listen((question){
          if(question != null){
            store.dispatch(ChangeQuestionAction(question: question));
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

  Widget _buildModal(QuestionState question){
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
              child: StoreConnector<AppState,Iterable<CommentState>>(
                onInit:(store) => store.dispatch(GetNextPageQuestionCommentsIfNoPageAction(questionId: widget.questionId)),
                converter: (store) => store.state.getQuestionComments(widget.questionId),
                builder: (context,comments) => CommentItemsWidget(
                  scrollController: _scrollController,
                  contentController: _contentController,
                  focusNode: _focusNode,
                  focusId: widget.displayedCommentId,
                  noItems: const NoCommentsWidget(),
                  pagination: question.comments,
                  comments: comments,
                  onScrollBottom: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    store.dispatch(GetNextPageQuestionCommentsIfReadyAction(questionId: widget.questionId));
                  },
                )
              ),
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
    return StoreConnector<AppState,QuestionState?>(
      converter: (store) => store.state.questionEntityState.entities[widget.questionId],
      builder: (context, question){
        if(question == null) return const LoadingWidget();
        if(widget.displayedCommentId != null){
          return StoreConnector<AppState,CommentState?>(
            onInit: (store) => store.dispatch(
              GetOutlierQuestionCommentAction(
                questionId: question.id,
                commentId: widget.displayedCommentId!
              )
            ),
            converter: (store) => store.state.commentEntityState.entities[widget.displayedCommentId],
            builder: (context,comment){
              if(comment == null) return const LoadingWidget();
              return _buildModal(question);
            },
          );
        }
        return _buildModal(question);
      }
    );
  }
}