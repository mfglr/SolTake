import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';
import 'package:my_social_app/views/question/widgets/question_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class DisplayQuestionPage extends StatefulWidget {
  final int questionId;
  final int? parentId;

  const DisplayQuestionPage({
    super.key,
    required this.questionId,
    this.parentId,
  });

  @override
  State<DisplayQuestionPage> createState() => _DisplayQuestionPageState();
}

class _DisplayQuestionPageState extends State<DisplayQuestionPage> {
  @override
  void initState() {
    if(widget.parentId != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator
          .of(context)
          .push(
            ModalBottomSheetRoute(
              builder: (context) => DisplayQuestionCommentsModal(
                questionId: widget.questionId,
                parentId: widget.parentId,
              ), 
              isScrollControlled: true
            )
          );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: widget.questionId)),
      converter: (store) => store.state.questionEntityState.entities[widget.questionId],
      builder: (context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
          ),
          body: SingleChildScrollView(
            child: QuestionItemWidget(
              question: question,
            )
          ),
        );
      }
    );
  }
}