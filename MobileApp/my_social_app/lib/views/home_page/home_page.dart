import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/story_circle_state.dart';
import 'package:my_social_app/helpers/start_creating_question.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/home_page/widgets/create_story_widget.dart';
import 'package:my_social_app/views/home_page/widgets/notification_button.dart';
import 'package:my_social_app/views/home_page/widgets/uploadings_button.dart';
import 'package:my_social_app/views/question/widgets/question_list_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/story/widgets/story_circles_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(
        store,
        selectHomePageQuestionPagination(store),
        const NextHomePageQuestionsAction()
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
        refreshEntities(store, selectHomePageQuestionPagination(store), const RefreshHomePageQuestionsAction());
        store.dispatch(const GetStoriesAction());
        return store.onChange.map((state) => state.questions.homePageQuestions).firstWhere((x) => !x.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SolTake"),
          actions: const [
            UploadingsButton(),
            NotificationButton(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => startCreatingQuestion(context),
          shape: const CircleBorder(),
          child: const Icon(Icons.question_mark),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const CreateStoryWidget(),
                    ),
                    StoreConnector<AppState,Iterable<StoryCircleState>>(
                      converter: (store) => selectHomePageStories(store),
                      builder:(context,storyCircles) => StoryCirclesWidget(storyCircles: storyCircles,)
                    )
                  ],
                ),
              ),
              StoreConnector<AppState, Pagination<int, QuestionState>>(
                onInit: (store) => 
                  getNextEntitiesIfNoPage(
                    store,
                    selectHomePageQuestionPagination(store),
                    const NextHomePageQuestionsAction()
                  ),
                converter: (store) => selectHomePageQuestionPagination(store),
                builder:(context, pagination) => Column(
                  children: [
                    QuestionListWidget(questions: pagination.values),
                    if(pagination.loadingNext)
                      const LoadingCircleWidget()
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}