import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getNextPageOfExamQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamQuestionsIfNoPageAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.questions;
    if(!pagination.isLast && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageExamQuestionsAction(examId: action.examId));
    }
  }
  next(action);
}
void getNextPageExamQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamQuestionsIfReadyAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.questions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageExamQuestionsAction(examId: action.examId));
    }
  }
  next(action);
}
void getNextPageExamQeuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageExamQuestionsAction){
    final examState = store.state.examEntityState.entities[action.examId]!;
    QuestionService()
      .getByExamId(action.examId,lastValue: examState.questions.lastValue)
      .then((questions){
        store.dispatch(AddNextPageExamQuestionsAction(examId: action.examId,questionIds: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddQuestionImagesListAction(lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void getAllExamsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetAllExamsAction){
    if(!store.state.examEntityState.isLoading && !store.state.examEntityState.isLast){
      ExamService()
        .getAll()
        .then((exams) => store.dispatch(AddAllExamsAction(exams: exams.map((e) => e.toExamState()))));
    }
  }
  next(action);
}

void getSubjectsOfSelectedExamMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetSubjectsOfSelectedExamAction){
    final examId = store.state.createQuestionState.examId!;
    final examState = store.state.examEntityState.entities[examId]!;
    if(!examState.subjects.isLast){
      SubjectService()
        .getByExamId(examId)
        .then((subjects){
          store.dispatch(AddSubjectsAction(subjects: subjects.map((e) => e.toSubjectState())));
          store.dispatch(GetExamSubjectsSuccessAction(examId: examId,ids: subjects.map((e) => e.id)));
        });
    }
  }
  next(action);
}
void getExamSubjectsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetExamSubjectsAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.subjects;
    if(!pagination.isLast){
      SubjectService()
        .getByExamId(action.examId)
        .then((subjects){
          store.dispatch(AddSubjectsAction(subjects: subjects.map((e) => e.toSubjectState())));
          store.dispatch(GetExamSubjectsSuccessAction(examId: action.examId,ids: subjects.map((e) => e.id)));
        });
    }
  }
  next(action);
}