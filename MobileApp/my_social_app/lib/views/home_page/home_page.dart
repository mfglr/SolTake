import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/helpers/start_creating_question.dart';
import 'package:my_social_app/state/app_state/home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/home_page/widgets/notification_button.dart';
import 'package:my_social_app/views/home_page/widgets/uploadings_button.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,HomePageState>(
      converter: (store) => store.state.homePageState,
      builder: (context,state) => RefreshIndicator(
        onRefresh: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getPrevPageIfReady(store, state.questions, const PrevHomePageQuestionsAction());
          return store.onChange.map((state) => state.homePageState.questions).firstWhere((x) => !x.loadingPrev);
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
          body: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(store,state.questions,const NextHomeQuestionsAction()),
            converter: (store) => store.state.selectHomePageQuestions,
            builder:(context,questions) => QuestionItemsWidget(
              questions: questions,
              pagination: state.questions,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store, state.questions,const NextHomeQuestionsAction());
              },
            ),
          ),
        ),
      )
    );
  }
}