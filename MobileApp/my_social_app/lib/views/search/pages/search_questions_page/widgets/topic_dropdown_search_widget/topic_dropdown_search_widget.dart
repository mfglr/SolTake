import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topics_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/selectors.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/topic_dropdown_search_widget/topic_dropdown_searhc_widget_constans.dart';

class TopicDropdownSearchWidget extends StatelessWidget {
  final SubjectState? subject;
  final TopicState? selectedTopic;
  final void Function(TopicState?) onChanged;
  const TopicDropdownSearchWidget({
    super.key,
    required this.subject,
    required this.selectedTopic,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return subject == null
      ? DropdownSearch<TopicState>(
          enabled: false,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: labelText[getLanguage(context)]
            ),
          ),
        )
      : StoreConnector<AppState, Pagination<int, TopicState>>(
          onInit: (store) =>
            getNextPageIfNoPage(
              store,
              selectSubjectTopics(store, subject!.id),
              NextSubjectTopicsAction(subjectId: subject!.id)
            ),
          converter: (store) => selectSubjectTopics(store, subject!.id),
          builder: (context, pagination) => DropdownSearch<TopicState>(
            selectedItem: selectedTopic,
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