import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_comment_modal.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayQuestionCommentsModal extends StatefulWidget {
  final int questionId;
  final int? parentId;

  const DisplayQuestionCommentsModal({
    super.key,
    required this.questionId,
    this.parentId
  });

  @override
  State<DisplayQuestionCommentsModal> createState() => _DisplayQuestionCommentsModalState();
}

class _DisplayQuestionCommentsModalState extends State<DisplayQuestionCommentsModal> {
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
    _questionConsumer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: widget.questionId)),
      converter: (store) => store.state.questionEntityState.entities[widget.questionId],
      builder: (context, question){
        if(question == null) return const LoadingWidget();
        return StoreConnector<AppState,Iterable<CommentState>>(
          onInit: (store) => store.dispatch(GetNextPageQuestionCommentsIfNoPageAction(questionId: widget.questionId)),
          converter: (store){
            if(widget.parentId == null) return store.state.selectQuestionComments(widget.questionId);
            return store.state.selectFormatedQuestionComments(widget.parentId!, widget.questionId);
          },
          builder:(context,comments) => DisplayCommentsModal(
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(GetNextPageQuestionCommentsIfReadyAction(questionId: widget.questionId));
            },
            parentId: widget.parentId,
            comments: comments,
            pagination: question.comments
          ),
        );
      }
    );
  }
}