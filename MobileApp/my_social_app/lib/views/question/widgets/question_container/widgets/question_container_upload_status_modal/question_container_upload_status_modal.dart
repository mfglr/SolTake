import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/entity_container_upload_status/entity_container_upload_status.dart';
import 'question_container_upload_status_modal_constants.dart';

class QuestionContainerUploadStatusModal extends StatelessWidget {
  final int questionId;
  const QuestionContainerUploadStatusModal({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,EntityContainer>(
      converter: (store) => selectQuestion(store, questionId),
      builder: (context, container) => AlertDialog(
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: EntityContainerUploadStatus(
                container: container,
                diameter: 60,
                failedIconSize: 25,
                rateTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                final container = selectQuestion(store, questionId);
                if(container.status == EntityStatus.uploadFailed){
                  store.dispatch(UploadQuestionAction(question: container.entity!));
                }
              },
              child: Text(
                contents[container.status]![getLanguage(context)]!,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}