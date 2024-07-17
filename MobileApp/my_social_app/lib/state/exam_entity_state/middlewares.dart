import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadExamsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadExamsAction){
    if(!store.state.examEntityState.isLoaded){
      ExamService()
        .getAll()
        .then(
          (exams) => store.dispatch(
            LoadExamSuccessAction(
              exams: exams.map((e) => e.toExamState()).toList()
            )
          )
        );
    }
  }
  next(action);
}

void nextPageOfExamQeuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfExamQuestionsAction){
    final examState = store.state.examEntityState.exams[action.examId]!;
    if(!examState.questions.isLast){
      QuestionService()
        .getByExamId(action.examId,lastId: examState.questions.lastId)
        .then((questions){
          store.dispatch(
            LoadQuestionsSuccessAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );
          
          store.dispatch(
            NextPageOfExamQuestionsSuccessAction(
              examId: action.examId,
              questionIds: questions.map((x) => x.id)
            )
          );

          store.dispatch(
            LoadExamSuccessAction(
              exams: questions.map((e) => e.exam.toExamState()) 
            )
          );

          store.dispatch(
            LoadSubjectsSuccessAction(
              subjects: questions.map((e) => e.subject.toSubjectState())
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
}