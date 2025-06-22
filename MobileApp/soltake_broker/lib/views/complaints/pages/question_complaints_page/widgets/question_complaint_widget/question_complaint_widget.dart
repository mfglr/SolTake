import 'package:flutter/material.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_complaint_status.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';
import 'package:soltake_broker/views/complaints/pages/question_complaints_page/widgets/question_complaint_widget/question_complaint_widget_constants.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

class QuestionComplaintWidget extends StatelessWidget {
  final QuestionUserComplaintState questionUserComplaint;
  const QuestionComplaintWidget({
    super.key,
    required this.questionUserComplaint
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if(questionUserComplaint.questionContent != null)
            Text(questionUserComplaint.questionContent!),
          MultimediaSlider(
            medias: questionUserComplaint.medias,
            blobServiceUrl: AppClient.blobService,
            notFoundMediaPath: "",
            noMediaPath: ""
          ),
          Column(
            children: [
              LanguageWidget(
                child: (language) => Text(
                  "Kategori: ${reasons[questionUserComplaint.reason][language]}"
                ),
              ),
              if(questionUserComplaint.reason == QuestionComplaintStatus.other)
                Text(
                  questionUserComplaint.content!
                )
            ],
          )
        ],
      ),
    );
  }
}