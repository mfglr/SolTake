import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_question_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateQuestionAction){
    ToastCreator.displaySuccess(questionCreationStartedNotificationContent[getLanguageByStore(store)]!);
    if(action.medias.isNotEmpty){
      store.dispatch(ChangeUploadStateAction(state: UploadQuestionState.init(action)));
    }

    QuestionService()
      .createQuestion(
        action.medias,action.examId,action.subjectId,action.topicId,action.content,
        (rate) => store.dispatch(ChangeUploadRateAction(id: action.id,rate: rate))
      )
      .then((question) {
        store.dispatch(AddQuestionAction(value: question.toQuestionState()));
        store.dispatch(AddNewUserQuestionAction(questionId: question.id, userId: question.userId));
        store.dispatch(RemoveUploadStateAction(id: action.id));
        ToastCreator.displaySuccess(questionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(id: action.id,status: UploadStatus.failed));
        throw e;
      });
  }
  next(action);
}
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
void deleteQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteQuestionAction){
    final accountId = store.state.login.login!.id;
    QuestionService()
      .delete(action.questionId)
      .then((_){
        store.dispatch(DeleteQuestionSuccessAction(questionId: action.questionId));
        store.dispatch(RemoveUserQuestionAction(userId: accountId, questionId: action.questionId));
      });
  }
  next(action);
}

//question likes;
void nextQuestionVideoSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionVideoSolutionsAction){
    final pagination = store.state.questionEntityState.getValue(action.questionId)!.videoSolutions;
    SolutionService()
      .getVideoSolutions(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionVideoSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(NextQuestionVideoSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}


