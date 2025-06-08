import 'package:flutter/material.dart';
import 'package:soltake_broker/constants/assets.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:soltake_broker/views/question/widgets/delete_question_button.dart';
import 'package:soltake_broker/views/question/widgets/publish_question_button.dart';
import 'package:soltake_broker/views/question/widgets/reject_question_button.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionWidget({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 3 / 5
            ),
            child: MultimediaSlider(
              key: ValueKey(question.id),
              medias: question.medias,
              blobServiceUrl: AppClient.blobService,
              notFoundMediaPath: noMediaAssetPath,
              noMediaPath: noMediaAssetPath,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PublishQuestionButton(question: question),
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RejectQuestionButton(question: question),
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DeleteQuestionButton(question: question),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}