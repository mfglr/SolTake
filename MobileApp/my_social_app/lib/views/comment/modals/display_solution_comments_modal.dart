import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_comment_modal.dart';
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
    _questionConsumer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SolutionState?>(
      onInit: (store) => store.dispatch(LoadSolutionAction(solutionId: widget.solutionId)),
      converter: (store) => store.state.solutionEntityState.entities[widget.solutionId],
      builder: (context, question){
        if(question == null) return const LoadingWidget();
        return StoreConnector<AppState,Iterable<CommentState>>(
          onInit: (store) => store.dispatch(GetNextPageSolutionCommentsIfNoPageAction(solutionId: widget.solutionId)),
          converter: (store) => store.state.selectSolutionComments(widget.solutionId),
          builder:(context,comments) => DisplayCommentsModal(
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(GetNextPageSolutionCommentsIfReadyAction(solutionId: widget.solutionId));
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