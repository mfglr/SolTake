import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadSubjectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSubjectAction){
    if(store.state.subjectEntityState.entities[action.subjectId] == null){
      SubjectService()
        .getSubjectById(action.subjectId)
        .then((subject) => store.dispatch(AddSubjectAction(subject: subject.toSubjectState())));
    }
  }
  next(action);
}
void nextSubjectQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSubjectQuestionsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    QuestionService()
      .getBySubjectId(action.subjectId,pagination.next)
      .then((questions){
        store.dispatch(NextSubjectQuestionsSuccessAction(subjectId: action.subjectId,questions: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(NextSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
void prevSubjectQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevSubjectQuestionsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    QuestionService()
      .getBySubjectId(action.subjectId,pagination.prev)
      .then((questions){
        store.dispatch(PrevSubjectQuestionsSuccessAction(subjectId: action.subjectId, questionIds: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(PrevSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
void nextSubjectTopicsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSubjectTopicsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.topics;
    TopicService()
      .getBySubjectId(action.subjectId,pagination.next)
      .then((topics){
        store.dispatch(AddTopicsAction(topics: topics.map((e) => e.toTopicState())));
        store.dispatch(NextSubjectTopicsSuccessAction(subjectId: action.subjectId,topicIds: topics.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextSubjectTopicsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
