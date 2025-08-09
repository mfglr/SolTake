import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
// import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';
import 'package:my_social_app/views/question/pages/display_question_page/pages/question_success_page.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

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
    // if(widget.parentId != null){
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator
    //       .of(context)
    //       .push(
    //         ModalBottomSheetRoute(
    //           builder: (context) => DisplayQuestionCommentsModal(
    //             question: widget.questionId,
    //             parentId: widget.parentId,
    //           ), 
    //           isScrollControlled: true
    //         )
    //       );
    //   });
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<QuestionState>>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: widget.questionId)),
      converter: (store) => selectQuestion(store, widget.questionId),
      builder: (context, container){
        if(container.isSuccess){
          return QuestionSuccessPage(question: container.entity!,);
        }
        else{
          return const LoadingCircleWidget();
        }
      }
    );
  }
}