import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getNextPageTopicQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageTopicQuestionsIfNoPageAction){
    final pagination = store.state.topicEntityState.entities[action.topicId]!.questions;
    if(!pagination.isLast && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageTopicQuestionsAction(topicId: action.topicId));
    }
  }
  next(action);
}
void getNextPageTopicQuestionsIfReadyMiddeware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageTopicQuestionsIfReadyAction){
    final pagination = store.state.topicEntityState.entities[action.topicId]!.questions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageTopicQuestionsAction(topicId: action.topicId));
    }
  }
  next(action);
}
void getNextPageTopicQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageTopicQuestionsAction){
    final pagination = store.state.topicEntityState.entities[action.topicId]!.questions;
    QuestionService()
      .getByTopicId(action.topicId, pagination.next)
      .then(
        (questions){
          store.dispatch(AddNextPageTopicQuestionsAction(topicId: action.topicId,questionIds: questions.map((x) => x.id).toList()));
          store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState()).toList()));
          store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
          store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
        }
      );
  }
  next(action);
}
