import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getNextPageSubjectQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSubjectQuestionsIfNoPageAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageSubjectQuestionsAction(subjectId: action.subjectId));
    }
  }
  next(action);
}
void getNextPageSubjectQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSubjectQuestionsIfReadyAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageSubjectQuestionsAction(subjectId: action.subjectId));
    }
  }
  next(action);
}
void getNextPageSubjectQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSubjectQuestionsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    QuestionService()
      .getBySubjectId(action.subjectId,pagination.next)
      .then((questions){
        store.dispatch(AddNextPageSubjectQuestionsAction(subjectId: action.subjectId,questions: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void getPrevPageSubjectQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetPrevPageSubjectQuestionsIfReadyAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    if(pagination.isReadyForPrevPage){
      store.dispatch(GetPrevPageSubjectQuestionsAction(subjectId: action.subjectId));
    }
  }
  next(action);
}
void getPrevPageSubjectQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetPrevPageSubjectQuestionsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.questions;
    QuestionService()
      .getBySubjectId(action.subjectId,pagination.prev)
      .then((questions){
        store.dispatch(AddPrevPageSubjectQuestionsAction(subjectId: action.subjectId, questionIds: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}


void getSubjectTopicsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSubjectTopicsIfNoPageAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.topics;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageSubjectTopicsAction(subjectId: action.subjectId));
    }
  }
  next(action);
}
void getSubjectTopicsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageSubjectTopicsAction){
    final pagination = store.state.subjectEntityState.entities[action.subjectId]!.topics;
    TopicService()
      .getBySubjectId(action.subjectId,pagination.next)
      .then((topics){
        store.dispatch(AddTopicsAction(topics: topics.map((e) => e.toTopicState())));
        store.dispatch(AddNextPageSubjectTopicsAction(subjectId: action.subjectId,topicIds: topics.map((e) => e.id)));
      });
  }
  next(action);
}
