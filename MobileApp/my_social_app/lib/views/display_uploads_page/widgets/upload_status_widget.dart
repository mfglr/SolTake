import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_message_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_question_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_solution_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UploadStatusWidget extends StatelessWidget {
  final UploadState state;
  const UploadStatusWidget({
    super.key,
    required this.state
  });

  Widget getCirclerLoading() => 
    const SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(),
    );

  @override
  Widget build(BuildContext context) {
    if(state.status == UploadStatus.loading && state.rate < 1){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Text(AppLocalizations.of(context)!.upload_status_widget_uploading)
          ),
          getCirclerLoading(),
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
            child: Text(AppLocalizations.of(context)!.upload_status_widget_processing)
          ),
          getCirclerLoading(),
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
            child: Text(
              AppLocalizations.of(context)!.upload_status_widget_uploading_success,
              style: const TextStyle(
                color: Colors.green
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
              child: Text(
                AppLocalizations.of(context)!.upload_status_widget_uploading_failed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red
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