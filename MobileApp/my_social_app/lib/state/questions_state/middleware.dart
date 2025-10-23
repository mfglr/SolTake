import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/search_page_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

//questions middleware
void loadQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadQuestionAction){
    QuestionService()
      .getById(action.questionId)
      .then((question) => store.dispatch(LoadQuestionSuccessAction(question: question.toQuestionState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(QuestionNotFoundAction(questionId: action.questionId));
          }
          else{
            store.dispatch(LoadQuestionFailedAction(questionId: action.questionId));
          }
        }
        throw e;
      });
  }
  next(action);
}
void uploadQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UploadQuestionAction){
    ToastCreator.displaySuccess(questionCreationStartedNotificationContent[getLanguageByStore(store)]!);
    QuestionService()
      .createQuestion(
        action.question.medias as Iterable<LocalMedia>,
        action.question.exam.id,
        action.question.subject.id,
        action.question.topic?.id,
        action.question.content,
        (rate){
          store.dispatch(ChangeQuestionRateAction(questionId: action.question.id, rate: rate));
          if(rate == 1){
            store.dispatch(MarkQuestionStatusAsProcessing(questionId: action.question.id));
          }
        }
      )
      .then((response) {
        store.dispatch(UploadQuestionSuccessAction(
          question: action.question,
          serverId: response.id,
          medias: response.medias.map((media) => media.toMedia())
        ));
        ToastCreator.displaySuccess(questionCreatedNotificationContent[getLanguageByStore(store)]!);
      })
      .catchError((e){
        store.dispatch(UploadQuestionFailedAction(questionId: action.question.id));
        throw e;
      });
  }
  next(action);
}
void deleteQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteQuestionAction){
    QuestionService()
      .delete(action.question.id)
      .then((_) => store.dispatch(DeleteQuestionSuccessAction(question: action.question)));
  }
  next(action);
}
//questions middleware

//home questions
void nexHomeQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextHomeQuestionsAction){
    QuestionService()
      .getHomePageQuestions(selectHomeQuestions(store).next)
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
      .getHomePageQuestions(selectHomeQuestions(store).first)
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

//search page questions
void nextSearchPageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSearchPageQuestionsAction){
    final searchPageState = selectSearchPageState(store);
    QuestionService()
      .searchQuestions(
        searchPageState.exam?.id,
        searchPageState.subject?.id,
        searchPageState.topic?.id,
        selectSearchPageQuestions(store).next
      )
      .then((questions) => store.dispatch(NextSearchPageQuestionsSuccessAction(
        questions: questions.map(((e) => e.toQuestionState()))
      )))
      .catchError((e){
        store.dispatch(const NextSearchPageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshSearchPageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSearchPageQuestionsAction){
    final searchPageState = selectSearchPageState(store);
    QuestionService()
      .searchQuestions(
        searchPageState.exam?.id,
        searchPageState.subject?.id,
        searchPageState.topic?.id,
        selectSearchPageQuestions(store).first
      )
      .then((questions) => store.dispatch(RefreshSearchPageQuestionsSuccessAction(
        questions: questions.map(((e) => e.toQuestionState()))
      )))
      .catchError((e){
        store.dispatch(const RefreshSearchPageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//search page questions

//video questions
void nextVideoQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextVideoQuestionsAction){
    QuestionService()
      .getVideoQuestions(selectVideoQuestions(store).next)
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
      .getVideoQuestions(selectVideoQuestions(store).first)
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
      .getByUserId(action.userId, store.state.questions.selectUserQuestions(action.userId).next)
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
      .getByUserId(action.userId, store.state.questions.selectUserQuestions(action.userId).first)
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
      .getSolvedQuestionsByUserId(action.userId, selectUserSolvedQuestions(store, action.userId).next)
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
      .getSolvedQuestionsByUserId(action.userId, selectUserSolvedQuestions(store, action.userId).first)
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
      .getUnsolvedQuestionsByUserId(action.userId, selectUserUnsolvedQuestions(store, action.userId).next)
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
      .getUnsolvedQuestionsByUserId(action.userId, selectUserUnsolvedQuestions(store, action.userId).first)
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
      .getByExamId(action.examId, selectExamQuestions(store, action.examId).next)
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
      .getByExamId(action.examId, selectExamQuestions(store, action.examId).first)
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

//subject questions
void nextSubjectQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSubjectQuestionsAction){
    QuestionService()
      .getBySubjectId(action.subjectId, selectSubjectQuestions(store, action.subjectId).next)
      .then((questions) => store.dispatch(NextSubjectQuestionsSuccessAction(
        subjectId: action.subjectId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(NextSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
void refreshSubjectQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSubjectQuestionsAction){
    QuestionService()
      .getBySubjectId(action.subjectId, selectSubjectQuestions(store,action.subjectId).first)
      .then((questions) => store.dispatch(RefreshSubjectQuestionsSuccessAction(
        subjectId: action.subjectId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(RefreshSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
//subject questions

//topic questions
void nextTopicQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextTopicQuestionsAction){
    QuestionService()
      .getByTopicId(action.topicId, selectTopicQuestions(store, action.topicId).next)
      .then((questions) => store.dispatch(NextTopicQuestionsSuccessAction(
        topicId: action.topicId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(NextTopicQuestionsFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}
void refreshTopicQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshTopicQuestionsAction){
    QuestionService()
      .getByTopicId(action.topicId, selectTopicQuestions(store, action.topicId).first)
      .then((questions) => store.dispatch(RefreshTopicQuestionsSuccessAction(
        topicId: action.topicId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(RefreshTopicQuestionsFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}
//topic questions

