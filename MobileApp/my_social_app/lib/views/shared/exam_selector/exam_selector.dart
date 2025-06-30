import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/views/shared/app_selector/app_selector.dart';
import 'package:my_social_app/views/shared/exam_selector/exam_selector_constants.dart';
import 'package:my_social_app/views/shared/exam_selector/widgets/exam_widget.dart';
import 'package:my_social_app/views/shared/exam_selector/widgets/selected_exam_widget.dart';

class ExamSelector extends StatefulWidget {
  const ExamSelector({super.key});

  @override
  State<ExamSelector> createState() => _ExamSelectorState();
}

class _ExamSelectorState extends State<ExamSelector> {
  @override
  Widget build(BuildContext context) {
    return AppSelector<int, ExamState>(
      showSearchField: true,
      hintText: selectExam[getLanguage(context)]!,
      itemBuilder: (item, selectExam) => ExamWidget(
        exam: item,
        selectExam: selectExam,
      ),
      isDescending: true,
      selectedItemsBuilder: (item, removeItem) => SelectedExamWidget(
        exam: item,
        removeExam: (exam) => removeItem(item),
      ),
      recordPerpage: examsPerPage,
      decoration: InputDecoration(
        hintText: searchExam[getLanguage(context)]
      ),
      calback: (key, page) =>
        ExamService()
          .search(key, page)
          .then((items) => items.map((item) => item.toExamState())),
    );
  }
}