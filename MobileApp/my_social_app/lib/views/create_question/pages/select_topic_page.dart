import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_question/pages/add_question_image_page/add_question_images_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectTopicPage extends StatefulWidget {
  final int subjectId;
  const SelectTopicPage({
    super.key,
    required this.subjectId
  });

  @override
  State<SelectTopicPage> createState() => _SelectTopicPageState();
}

class _SelectTopicPageState extends State<SelectTopicPage> {
  String _content = "";
  Iterable<int> _topicIds = [];

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
                onInit: (store) => store.dispatch(GetNextPageSubjectTopicsIfNoPageAction(subjectId: widget.subjectId)),
                converter: (store) => store.state.selectSubjectTopics(widget.subjectId),
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
                  onChanged: (value) => setState(() {
                    _topicIds = topics.where((x) => value.any((name) => name == x.name)).map((x) => x.id);
                  }),
                ),
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: null,
              maxLength: questionContentMaxLenght,
              onChanged: (value) => setState(() { _content = value; }),
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
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const AddQuestionImagesPage()))
              .then((value){
                if(value == null) return;
                Navigator
                  .of(context)
                  .pop((
                    content: _content,
                    topicIds: _topicIds,
                    images: value
                  ));
              });
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