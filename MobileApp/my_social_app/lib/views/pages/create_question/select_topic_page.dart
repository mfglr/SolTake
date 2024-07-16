import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectTopicPage extends StatelessWidget {
  const SelectTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: StoreConnector<AppState,List<TopicState>>(
                onInit: (store) => store.dispatch(const LoadTopicsAction()),
                converter: (store) => store.state.topics,
                builder:(context,topics) => DropdownSearch<String>.multiSelection(
                  items: topics.map((e) => e.name).toList(),
                  onBeforeChange: (prevItems, nextItems){
                    if(nextItems.length >= 4){
                      ToastCreator.displayError("You can't select up to 3 topics per question");
                      return Future.value(false);
                    }
                    return Future.value(true);
                  },
                  popupProps: const PopupPropsMultiSelection.menu(
                    showSearchBox: true,
                    searchDelay: Duration(),
                  ),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Select Topics"
                    ),
                  ),
                  onChanged: (value){
                    final topicIds = topics.where((x) => value.any((name) => name == x.name)).map((x) => x.id).toList();
                    store.dispatch(UpdateTopicIdsAction(topicIds: topicIds));
                  },
                ),
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: null,
              onChanged: (value) => store.dispatch(UpdateContentAction(content: value)),
              decoration: const InputDecoration(
                hintText: "Type somethings about the question...",
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const  EdgeInsets.all(15),
        child: OutlinedButton(
          onPressed: (){
            store.dispatch(const CreateQuestionAction());
            Navigator.of(context).popUntil((route) => route.settings.name == displayImagesRoute);
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: const Text("Create Question"),
              ),
              const Icon(Icons.create)
            ],
          ),
        ),
      ),
    );
  }
}