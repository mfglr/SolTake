import 'package:app_file/app_file.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/media/models/local_media.dart';
import 'package:my_social_app/media/pages/select_directory_page/select_directory_page.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/topics_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/create_topic_request_button/create_topic_request_button.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/no_topics_widget/no_topics_widget.dart';
import 'package:my_social_app/views/create_question/widgets/create_question_button/create_question_button.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'select_topic_page_texts.dart';

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
  TopicState? _topic;

  void _createQuestion() =>
    Navigator
      .of(context)
      .pop((content: _content, topicId: _topic?.id, medias: const Iterable<AppFile>.empty()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ),
        ),
        actions: const [
          CreateTopicRequestButton()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: StoreConnector<AppState,Pagination<int,TopicState>>(
                onInit: (store) => getNextPageIfNoPage(
                  store,
                  selectSubjectTopics(store, widget.subjectId),
                  NextSubjectTopicsAction(subjectId: widget.subjectId)
                ),
                converter: (store) => selectSubjectTopics(store, widget.subjectId),
                builder: (context, pagination) => DropdownSearch<TopicState>(
                  enabled: !pagination.isEmpty,
                  items: pagination.values.toList(),
                  popupProps: PopupPropsMultiSelection.menu(
                    showSearchBox: true,
                    searchDelay: const Duration(),
                    emptyBuilder: (context,item) => const NoTopicsWidget()
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: title[getLanguage(context)]
                    ),
                  ),
                  onChanged: (value) => setState(() => _topic = value),
                ),
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: null,
              maxLength: questionContentMaxLenght,
              onChanged: (value) => setState(() { _content = value; }),
              decoration: InputDecoration(
                hintText: aboutQuestion[getLanguage(context)],
                border: const OutlineInputBorder()
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                Navigator
                  .of(context)
                  .push<Iterable<LocalMedia>?>(MaterialPageRoute(
                    builder: (context) => const SelectDirectoryPage(
                      maxNumberOfMediax: 5
                    )
                  ))
                  .then((medias){
                    if(medias == null || !context.mounted) return;
                    Navigator
                      .of(context)
                      .pop((content: _content, topicId: _topic?.id, medias: medias));
                  }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: LanguageWidget(
                      child: (language) => Text(
                        addMedia[language]!
                      ),
                    ),
                  ),
                  const Icon(Icons.videocam),
                  const Icon(Icons.photo),
                  const Icon(Icons.spatial_audio_off_rounded)
                ],
              ),
            ),
            CreateQuestionButton(onPressed: _createQuestion,),
          ],
        ),
      ),
    );
  }
}