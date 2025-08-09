import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/question_video_page_slider.dart';

class DisplayVideoQuestions extends StatelessWidget {
  const DisplayVideoQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context, listen: false);
        final pagination = selectVideoQuestionPagination(store);
        if(!pagination.loadingNext){
          store.dispatch(const RefreshVideoQuestionsAction());
        }
        return onVideoQuestionsLoaded(store);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withAlpha(77),
        body: StoreConnector<AppState,(KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final pagination = selectVideoQuestionPagination(store);
            if(pagination.noPage){
              store.dispatch(const NextVideoQuestionsAction());
            }
          },
          converter: (store) => selectVideoPaginationAndQuestions(store),
          builder: (context, x) => QuestionVideoPageSlider(
            questions: x.$2,
            onNext: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              final pagination = selectVideoQuestionPagination(store);
              if(pagination.isReadyForNextPage){
                store.dispatch(const NextVideoQuestionsAction());
              }
            },
          )
        ),
      ),
    );
  }
}