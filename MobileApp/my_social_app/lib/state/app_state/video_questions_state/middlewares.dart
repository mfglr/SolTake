import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/video_questions_state/actions.dart';
import 'package:redux/redux.dart';

void nextVideoQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextVideoQuestionsAction){
    final pagination = store.state.videoQuestions;
    QuestionService()
      .getVideoQuestions(pagination.next)
      .then((questions){
        store.dispatch(NextVideoQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(const NextVideoQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}