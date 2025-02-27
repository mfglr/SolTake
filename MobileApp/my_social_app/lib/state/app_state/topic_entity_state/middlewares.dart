import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void nextTopicQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextTopicQuestionsAction){
    final pagination = store.state.topicEntityState.getValue(action.topicId)!.questions;
    QuestionService()
      .getByTopicId(action.topicId, pagination.next)
      .then(
        (questions){
          store.dispatch(NextTopicQuestionsSuccessAction(topicId: action.topicId,questionIds: questions.map((x) => x.id).toList()));
          store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState()).toList()));
          var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
          store.dispatch(AddTopicsAction(topics: topics));
        }
      )
      .catchError((e){
        store.dispatch(NextTopicQuestionFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}
void prevTopicQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevTopicQuestionsAction){
    final pagination = store.state.topicEntityState.getValue(action.topicId)!.questions;
    QuestionService()
      .getByTopicId(action.topicId, pagination.prev)
      .then(
        (questions){
          store.dispatch(PrevTopicQuestionsSuccessAction(topicId: action.topicId,questionIds: questions.map((x) => x.id).toList()));
          store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState()).toList()));
          var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
          store.dispatch(AddTopicsAction(topics: topics));
        }
      )
      .catchError((e){
        store.dispatch(PrevTopicQuestionsFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}