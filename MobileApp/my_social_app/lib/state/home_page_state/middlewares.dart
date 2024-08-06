import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/home_page_state/actions.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void nextPageOfHomeQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfHomeQuestionsAction){
    final questions = store.state.homePageState.questions;
    if(!questions.isLast){
      QuestionService()
        .getAll(lastValue: questions.lastValue)
        .then((questions){
          store.dispatch(
            AddQuestionsAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );
          store.dispatch(
            NextPageOfHomeQuestionsSuccessAction(
              questionIds: questions.map((e) => e.id)
            )
          );
          store.dispatch(
            AddQuestionImagesListAction(
              lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))
            )
          );
          store.dispatch(
            AddUserImagesAction(
              images: questions.map((e) => UserImageState(id: e.appUserId, image: null, state: ImageStatus.notStarted))
            )
          );
          store.dispatch(
            AddExamsAction(
              exams: questions.map((e) => e.exam.toExamState()) 
            )
          );
          store.dispatch(
            AddSubjectsAction(
              subjects: questions.map((e) => e.subject.toSubjectState())
            )
          );
          store.dispatch(
            AddTopicsListAction(
              lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))
            )
          );
        });
    }
  }
  next(action);
}
void nextPageOfHomeQuestionsIfNoQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfHomeQuestionsIfNoQuestionsAction){
    final questions = store.state.homePageState.questions;
    if(!questions.isLast && questions.ids.isEmpty){
      store.dispatch(const NextPageOfHomeQuestionsAction());
    }
  }
  next(action);
}
