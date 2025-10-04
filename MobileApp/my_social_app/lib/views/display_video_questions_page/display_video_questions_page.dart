import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/question/widgets/question_video_scroller/question_video_scroller.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'display_video_questions_page_constants.dart';

class DisplayVideoQuestionsPage extends StatelessWidget {
  const DisplayVideoQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context, listen: false);
        refreshEntities(
          store,
          selectVideoQuestions(store),
          const RefreshVideoQuestionsAction()
        );
        return onVideoQuestionsLoaded(store);
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppTitle(
            title: title[getLanguage(context)]!
          ),
        ),
        backgroundColor: Colors.white,
        body: StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
          onInit: (store) => getNextEntitiesIfNoPage(
            store,
            selectVideoQuestions(store),
            const NextVideoQuestionsAction()
          ),
          converter: (store) => selectVideoQuestions(store),
          builder: (context, pagination) => 
            Column(
              children: [
                if(pagination.isEmpty)
                  const SpaceSavingWidget()
                else
                  Expanded(
                    child: QuestionVideoScroller(
                      containers: pagination.containers,
                      onNext: (){
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        getNextEntitiesIfReady(
                          store,
                          selectVideoQuestions(store),
                          const NextVideoQuestionsAction()
                        );
                      },
                    ),
                  ),
              ],
            )
        ),
      ),
    );
  }
}