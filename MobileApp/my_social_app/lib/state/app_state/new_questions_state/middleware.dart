import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_question_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
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
        store.dispatch(CreateQuestionSuccessAction(question: question.toQuestionState()));
        ToastCreator.displaySuccess(questionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(id: action.id,status: UploadStatus.failed));
        throw e;
      });
  }
  next(action);
}

//home questions
void nexHomeQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextHomeQuestionsAction){
    QuestionService()
      .getHomePageQuestions(selectHomeQuestionPagination(store).next)
      .then((questions) => store.dispatch(NextHomeQuestionsSuccessAction(
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(const NextHomeQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshHomeQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshHomeQuestionsAction){
    QuestionService()
      .getHomePageQuestions(selectHomeQuestionPagination(store).first)
      .then((questions) => store.dispatch(RefreshHomeQuestionsSuccessAction(
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(const RefreshHomeQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//home questions

//video questions
void nextVideoQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextVideoQuestionsAction){
    QuestionService()
      .getVideoQuestions(selectVideoQuestionPagination(store).next)
      .then((questions) => store.dispatch(NextVideoQuestionsSuccessAction(
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(const NextVideoQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshVideoQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshVideoQuestionsAction){
    QuestionService()
      .getVideoQuestions(selectVideoQuestionPagination(store).first)
      .then((questions) => store.dispatch(RefreshVideoQuestionsSuccessAction(
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(const RefreshVideoQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//video questions

//user questions
void nextUserQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserQuestionsAction){
    QuestionService()
      .getByUserId(action.userId, selectUserQuestionPagination(store, action.userId).next)
      .then((questions) => store.dispatch(NextUserQuestionsSuccessAction(
        userId: action.userId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(NextUserQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserQuestionsAction){
    QuestionService()
      .getByUserId(action.userId, selectUserQuestionPagination(store, action.userId).first)
      .then((questions) => store.dispatch(RefreshUserQuestionsSuccessAction(
        userId: action.userId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(RefreshUserQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user questions

//user solved questions
void nextUserSolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserSolvedQuestionsAction){
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, selectUserSolvedQuestionPagination(store, action.userId).next)
      .then((questions) => store.dispatch(NextUserSolvedQuestionsSuccessAction(
        userId: action.userId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(NextUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserSolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserSolvedQuestionsAction){
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, selectUserSolvedQuestionPagination(store, action.userId).first)
      .then((questions) => store.dispatch(RefreshUserSolvedQuestionsSuccessAction(
        userId: action.userId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(RefreshUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user solved questions

//user unsolved questions
void nextUserUnsolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserUnsolvedQuestionsAction){
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, selectUserUnsolvedQuestionPagination(store, action.userId).next)
      .then((questions) => store.dispatch(NextUserUnsolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(NextUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserUnsolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserUnsolvedQuestionsAction){
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, selectUserUnsolvedQuestionPagination(store, action.userId).first)
      .then((questions) => store.dispatch(RefreshUserUnsolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(RefreshUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user unsolved questions

//exam questions
void nextExamQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextExamQuestionsAction){
    QuestionService()
      .getByExamId(action.examId, selectExamQuestionPagination(store, action.examId).next)
      .then((questions) => store.dispatch(NextExamQuestionsSuccessAction(
        examId: action.examId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(NextExamQuestionsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
void refreshExamQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshExamQuestionsAction){
    QuestionService()
      .getByExamId(action.examId, selectExamQuestionPagination(store, action.examId).first)
      .then((questions) => store.dispatch(RefreshExamQuestionsSuccessAction(
        examId: action.examId,
        questions: questions.map((e) => e.toQuestionState())
      )))
      .catchError((e){
        store.dispatch(RefreshExamQuestionsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
//exam questions