import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_message_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_question_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_status_widget/upload_status_widget_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class UploadStatusWidget extends StatelessWidget {
  final UploadState state;
  const UploadStatusWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    if(state.status == UploadStatus.loading && state.rate < 1){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: LanguageWidget(
              child: (language) => Text(
                uploading[language]!
              ),
            )
          ),
          const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(color: Colors.green,),
          ),
        ],
      );
    }
    if(state.status == UploadStatus.loading && state.rate >= 1){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: LanguageWidget(
              child: (language) => Text(
                processing[language]!
              ),
            )
          ),
          LoadingAnimationWidget.threeRotatingDots(
            color: Colors.green,
            size: 15
          ),
        ],
      );
    }
    if(state.status == UploadStatus.success){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: LanguageWidget(
              child: (language) => Text(
                successfull[language]!,
                style: const TextStyle(
                  color: Colors.green
                ),
              ),
            )
          ),
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ],
      );
    }
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        if(state is UploadSolutionState){
          final uploadSolutionState = state as UploadSolutionState;
          store.dispatch(CreateSolutionAction(
            id: uploadSolutionState.id,
            questionId: uploadSolutionState.questionId,
            content: uploadSolutionState.content,
            medias: uploadSolutionState.medias
          ));
        }
        else if(state is UploadQuestionState){
          final uploadSolutionState = state as UploadQuestionState;
          store.dispatch(CreateQuestionAction(
            id: uploadSolutionState.id,
            medias: uploadSolutionState.medias,
            content: uploadSolutionState.content,
            examId: uploadSolutionState.examId,
            subjectId: uploadSolutionState.subjectId,
            topicId: uploadSolutionState.topicId
          ));
        }
        else{
          final uploadMessageState = state as UploadMessageState;
          store.dispatch(CreateMessageWithMediasAction(
            id: uploadMessageState.id,
            receiverId: uploadMessageState.userId,
            content: uploadMessageState.content,
            medias: uploadMessageState.medias
          ));
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              child: LanguageWidget(
                child: (language) => Text(
                  failed[language]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red
                  ),
                ),
              )
            ),
          ),
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}