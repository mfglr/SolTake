import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadSubjectsMiddelware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSubjectsByExamIdAction){
    final examId = store.state.createQuestionState.examId!;
    if(!store.state.subjectEntityState.isLoaded(examId)){
      SubjectService()
        .getByExamId(examId)
        .then(
          (subjects) => store.dispatch(
            LoadSubjectsByExamIdSuccessAction(
              examId: examId,
              payload: subjects.map((e) => e.toSubjectState()))
          )
        );
    }
  }
  next(action);
}

void loadQuestionsBySubjectId(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfSubjectQuestionsAction){
    final subject = store.state.subjectEntityState.subjects[action.subjectId]!;
    if(!subject.questions.isLast){
      QuestionService()
        .getBySubjectId(action.subjectId,lastId: subject.questions.lastId)
        .then((questions){
          store.dispatch(
            LoadQuestionsSuccessAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );
          
          store.dispatch(
            NextPageOfSubjectQuestionsSuccessAction(
              subjectId: action.subjectId,
              questions: questions.map((x) => x.id)
            )
          );

          for(final q in questions){
            store.dispatch(LoadTopicsSuccessAction(
              topics: q.topics.map((e) => e.toTopicState()))
            );
          }
        });
    }
  }
  next(action);
}