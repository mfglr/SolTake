import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subjects_state/actions.dart';
import 'package:my_social_app/state/subjects_state/selectors.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/subject_dropdown_search_widget/subject_dropdown_search_widget_constants.dart';

class SubjectDropdownSearchWidget extends StatelessWidget {
  final ExamState? exam;
  final SubjectState? selectedSubject;
  final void Function(SubjectState? subject) onChanged;
  
  const SubjectDropdownSearchWidget({
    super.key,
    required this.onChanged,
    required this.exam,
    required this.selectedSubject
  });

  @override
  Widget build(BuildContext context) {
    return exam == null
      ? DropdownSearch<SubjectState>(
          enabled: false,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: labelText[getLanguage(context)]
            ),
          ),
        )
      : StoreConnector<AppState, Pagination<int, SubjectState>>(
          onInit: (store) =>
            getNextPageIfNoPage(
              store,
              selectExamSubjects(store, exam!.id),
              NextExamSubjectsAction(examId: exam!.id)
            ),
          converter: (store) => selectExamSubjects(store, exam!.id),
          builder: (context, pagination) => DropdownSearch<SubjectState>(
            selectedItem: selectedSubject,
            items: pagination.values.toList(),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: labelText[getLanguage(context)]
              ),
            ),
            onChanged: onChanged,
          ),
        );
  }
}