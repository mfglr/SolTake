import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_containers_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplayTopicQuestionsPage extends StatefulWidget {
  final TopicState topic;
  const DisplayTopicQuestionsPage({super.key, required this.topic});

  @override
  State<DisplayTopicQuestionsPage> createState() => _DisplayTopicQuestionsPageState();
}

class _DisplayTopicQuestionsPageState extends State<DisplayTopicQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(
        store,
        selectTopicQuestions(store,widget.topic.id),
        NextTopicQuestionsAction(topicId: widget.topic.id)
      );
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectTopicQuestions(store, widget.topic.id),
          RefreshTopicQuestionsAction(topicId: widget.topic.id)
        );
        return onTopicQuestionsLoaded(store, widget.topic.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${AppLocalizations.of(context)!.display_topic_questions_page_title}: ${widget.topic.name}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
          onInit: (store) => getNextEntitiesIfNoPage(
            store,
            selectTopicQuestions(store, widget.topic.id),
            NextTopicQuestionsAction(topicId: widget.topic.id)
          ),
          converter: (store) => selectTopicQuestions(store, widget.topic.id),
          builder: (context, pagination) => SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                QuestionContinersWidget(
                  containers: pagination.containers,
                ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}