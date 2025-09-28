import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/question.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/select_directory_page.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/client_id_generator.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/topics_state/actions.dart';
import 'package:my_social_app/state/topics_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/state/users_state/selectors.dart';
import 'package:my_social_app/views/create_question/pages/preview_page/preview_page.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/create_topic_request_button/create_topic_request_button.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/no_topics_widget/no_topics_widget.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/preview_button/preview_button.dart';
import 'package:my_social_app/views/create_question/widgets/create_question_button/create_question_button.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'select_topic_page_texts.dart';

class SelectTopicPage extends StatefulWidget {
  final ExamState exam;
  final SubjectState subject;
  const SelectTopicPage({
    super.key,
    required this.exam,
    required this.subject
  });

  @override
  State<SelectTopicPage> createState() => _SelectTopicPageState();
}

class _SelectTopicPageState extends State<SelectTopicPage> {
  String _content = "";
  TopicState? _topic;
  Iterable<LocalMedia> _medias = [];

  void _createQuestion(){
    if(_content == "" && _medias.isEmpty){
      throw contentException[getLanguage(context)]!;
    }
    Navigator
      .of(context)
      .pop((content: _content, topic: _topic, medias: _medias));
  }

  void _takeMedia() =>
    Navigator
      .of(context)
      .push<Iterable<LocalMedia>?>(MaterialPageRoute(
        builder: (context) => const SelectDirectoryPage(
          maxNumberOfMediax: 5
        )
      ))
      .then((medias) => setState(() => _medias = medias ?? _medias ));

  void _preview(){
    if(_content == "" && _medias.isEmpty){
      throw contentException[getLanguage(context)]!;
    }
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => PreviewPage(
        container: _createContainer()
      )));
  }

  EntityContainer<int, QuestionState> _createContainer(){
    final store = StoreProvider.of<AppState>(context, listen: false);
    var userId = store.state.login.login!.id;
    var user = selectUserById(store, userId).entity!;
    var id = ClientIdGenerator.generate();

    var question = QuestionState.create(
      id: id,
      userId: user.id,
      userName: user.userName,
      content: _content,
      exam: widget.exam,
      subject: widget.subject,
      topic: _topic,
      medias: _medias,
      image: user.image
    );

    return EntityContainer<int, QuestionState>.create(id).upload(question);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: StoreConnector<AppState,Pagination<int, TopicState>>(
                  onInit: (store) => getNextPageIfNoPage(
                    store,
                    selectSubjectTopics(store, widget.subject.id),
                    NextSubjectTopicsAction(subjectId: widget.subject.id)
                  ),
                  converter: (store) => selectSubjectTopics(store, widget.subject.id),
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
                    onChanged: (value) => setState(() => _topic = value ),
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
              if(_medias.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: MediaQuery.of(context).size.width * 3 / 5,
                  child: MediaSlider(
                    medias: _medias,
                    blobService: AppClient.blobService,
                  ),
                ),
              OutlinedButton(
                onPressed: _takeMedia,
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
              CreateQuestionButton(
                onPressed: _createQuestion,
              ),
              PreviewButton(
                onTap: _preview,
              )
            ],
          ),
        ),
      ),
    );
  }
}