import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/views/pages/create_question/widgets/exam_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectExamPage extends StatelessWidget {
  
  const SelectExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).width / 2;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: height,
                  child: const ExamItemWidget(
                    shortName: "TYT",
                    fullName: "Temel Yeterlilik Testi",
                    exam: Exam.tyt,
                  )
                )
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: const ExamItemWidget(
                    shortName: "AYT",
                    fullName: "Alan Yeterlilik Testi",
                    exam: Exam.ayt
                  )
                )
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: height,
                  child: const ExamItemWidget(
                    shortName: "LGS",
                    fullName: "Liselere Geçiş Sistemi",
                    exam: Exam.lgs,
                  )
                )
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: const ExamItemWidget(
                    shortName: "DGS",
                    fullName: "Dikey Geçiş Sınavı",
                    exam: Exam.dgs
                  )
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}