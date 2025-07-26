import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';


void loadQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LoadQuestionAction){
    if(store.state.questionEntityState.getValue(action.questionId) == null){
      QuestionService()
        .getById(action.questionId)
        .then((question){
          store.dispatch(AddQuestionAction(value: question.toQuestionState()));
          store.dispatch(AddExamAction(exam: question.exam.toExamState()));
          store.dispatch(AddSubjectAction(subject: question.subject.toSubjectState()));
          if(question.topic != null){
            store.dispatch(AddTopicAction(topic: question.topic!.toTopicState()));
          }
        });
    }
  }
  next(action);
}
