import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void nextPageOfSubjectQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfSubjectQuestionsAction){
    final subject = store.state.subjectEntityState.entities[action.subjectId]!;
    if(!subject.questions.isLast){
      QuestionService()
        .getBySubjectId(action.subjectId,lastId: subject.questions.lastId)
        .then((questions){
          store.dispatch(
            AddQuestionsAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );
          
          store.dispatch(
            NextPageOfSubjectQuestionsSuccessAction(
              subjectId: action.subjectId,
              questions: questions.map((x) => x.id)
            )
          );

          store.dispatch(
            AddQuestionImagesListAction(
              lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: questions.map((e) => UserImageState(id: e.appUserId, image: null, state: ImageState.notLoaded))
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

void loadSubjectTopicsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadTopicsOfSelectedSubjectAction){
    final subjectId = store.state.createQuestionState.subjectId!;
    final subjectState = store.state.subjectEntityState.entities[subjectId]!;
    if(!subjectState.topics.isLast){
      TopicService()
        .getBySubjectId(subjectId)
        .then((topics){
          store.dispatch(
            AddTopicsAction(
              topics: topics.map((e) => e.toTopicState())
            )
          );

          store.dispatch(
            LoadTopicsOfSelectedSubjectSuccessAction(
              subjectId: subjectId,
              topicIds: topics.map((e) => e.id)
            )
          );
        });
    }
  }
  next(action);
}