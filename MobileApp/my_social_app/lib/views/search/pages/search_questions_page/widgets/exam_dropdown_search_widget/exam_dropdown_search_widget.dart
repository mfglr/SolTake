import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/exams_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/exams_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/exam_dropdown_search_widget/exam_dropdown_search_widget_constants.dart';

class ExamDropdownSearchWidget extends StatelessWidget {
  final ExamState? selectedExam;
  final void Function(ExamState? exam) onChanged;
  const ExamDropdownSearchWidget({
    super.key,
    required this.selectedExam,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Pagination<int, ExamState>>(
      onInit: (store) => getNextPageIfNoPage(store, selectExams(store), const NextExamsAction()),
      converter: (store) => selectExams(store),
      builder:(context, pagination) => DropdownSearch<ExamState>(
        selectedItem: selectedExam,
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