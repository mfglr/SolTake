import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_question_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectTopicPage extends StatelessWidget {
  const SelectTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: AppLocalizations.of(context)!.select_topics_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: StoreConnector<AppState,Iterable<TopicState>>(
                onInit: (store) => store.dispatch(const GetTopicsOfSelectedSubjectAction()),
                converter: (store) => store.state.topicsOfSelecetedSubject,
                builder:(context,topics) => DropdownSearch<String>.multiSelection(
                  items: topics.map((e) => e.name).toList(),
                  onBeforeChange: (prevItems, nextItems){
                    if(nextItems.length > 3){
                      ToastCreator.displayError(AppLocalizations.of(context)!.select_topics_page_topic_error_message);
                      return Future.value(false);
                    }
                    return Future.value(true);
                  },
                  popupProps: const PopupPropsMultiSelection.menu(
                    showSearchBox: true,
                    searchDelay: Duration(),
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.select_topics_page_label
                    ),
                  ),
                  onChanged: (value){
                    final topicIds = topics.where((x) => value.any((name) => name == x.name)).map((x) => x.id);
                    store.dispatch(UpdateTopicIdsAction(topicIds: topicIds));
                  },
                ),
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: null,
              maxLength: questionContentMaxLenght,
              onChanged: (value) => store.dispatch(UpdateContentAction(content: value)),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.select_topics_page_about_question,
                border: const OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const  EdgeInsets.all(15),
        child: OutlinedButton(
          onPressed: (){
            Navigator.of(context).pushNamed(displayQuestionImagesRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: Text(AppLocalizations.of(context)!.select_topics_page_add_images_button),
              ),
              const Icon(Icons.photo)
            ],
          ),
        ),
      ),
    );
  }
}