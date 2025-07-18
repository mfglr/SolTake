import 'package:app_file/app_file.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/create_topic_request_button/create_topic_request_button.dart';
import 'package:my_social_app/views/create_question/widgets/create_question_button/create_question_button.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/create_question/pages/add_question_medias_page/add_question_medias_page.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

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
  num? _topicId;

  void _createQuestion() =>
    Navigator
      .of(context)
      .pop((content: _content,topicId: _topicId, medias: const Iterable<AppFile>.empty()));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SubjectState?>(
      onInit: (store) => store.dispatch(LoadSubjectAction(subjectId: widget.subjectId)),
      converter: (store) => store.state.subjectEntityState.getValue(widget.subjectId),
      builder: (context,subject){
        if(subject == null) return const LoadingView();
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
                  child: StoreConnector<AppState,Iterable<TopicState>>(
                    onInit: (store) => getNextPageIfNoPage(
                      store,
                      subject.topics,
                      NextSubjectTopicsAction(subjectId: widget.subjectId)
                    ),
                    converter: (store) => store.state.selectSubjectTopics(widget.subjectId),
                    builder:(context,topics) => DropdownSearch<String>(
                      enabled: topics.isNotEmpty,
                      items: topics.map((e) => e.name).toList(),
                      popupProps: PopupPropsMultiSelection.menu(
                        showSearchBox: true,
                        searchDelay: const Duration(),
                        emptyBuilder: (context,item){
                          if(topics.isEmpty) return const LoadingCircleWidget();
                          return Container();
                        }
                      ),
                      
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: title[getLanguage(context)]
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        _topicId = topics.firstWhereOrNull((x) => value == x.name)?.id;
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
                    hintText: aboutQuestion[getLanguage(context)],
                    border: const OutlineInputBorder()
                  ),
                ),
                CreateQuestionButton(onPressed: _createQuestion,),
                OutlinedButton(
                  onPressed: () =>
                    Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (context) => const AddQuestionMediasPage()))
                      .then((value){
                        if(value == null) return;
                        if(context.mounted){
                          Navigator
                            .of(context)
                            .pop((content: _content, topicId: _topicId, medias: value));
                        }
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
              ],
            ),
          ),
        );
      }
    );
  }
}