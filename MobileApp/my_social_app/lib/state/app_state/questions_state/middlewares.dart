import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/question_user_like_service.dart';
import 'package:my_social_app/services/question_user_save_service.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/search_page_state/actions.dart';
import 'package:my_social_app/state/app_state/search_page_state/selectors.dart';
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
void deleteQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteQuestionAction){
    QuestionService()
      .delete(action.question.id)
      .then((_) =>store.dispatch(DeleteQuestionSuccessAction(question: action.question)));
  }
  next(action);
}

//search page state
void changeExamMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeExamAction){
    final searchPageState = selectSearchPageState(store).changeExam(action.exam);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
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
void changeSubjectMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeSubjectAction){
    final searchPageState = selectSearchPageState(store).changeSubject(action.subject);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
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
void changeTopicMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeTopicAction){
    final searchPageState = selectSearchPageState(store).changeTopic(action.topic);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
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
//search page state

//question user likes;
void likeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LikeQuestionAction){
    QuestionUserLikeService()
      .like(action.question.id)
      .then((response) => store.dispatch(LikeQuestionSuccessAction(
        question: action.question,
        questionUserLike: response.toQuestionUserLikeState()
      )));
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionUserLikeService()
      .dislike(action.question.id)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(
        question: action.question,
        userId: store.state.login.login!.id
      )));
  }
  next(action);
}
void nextQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionUserLikesAction){
    final pagination = selectQuestionUserLikes(store, action.questionId);
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, pagination.next)
      .then((likes) => store.dispatch(NextQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(NextQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionUserLikesAction){
    final pagination = selectQuestionUserLikes(store, action.questionId);
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, pagination.first)
      .then((likes) => store.dispatch(RefreshQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(RefreshQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      }); 
  }
  next(action);
}
//question user likes;

//questionUserSaves
void nextQuestionUserSavesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionUserSavesAction){
    final pagination = selectQuestionUserSaves(store);
    QuestionUserSaveService()
      .get(pagination.next)
      .then((e) => store.dispatch(NextQuestionUserSavesSuccessAction(questionUserSaves: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextQuestionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshQuestionUserSavesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionUserSavesAction){
    final pagination = selectQuestionUserSaves(store);
    QuestionUserSaveService()
      .get(pagination.first)
      .then((e) => store.dispatch(RefreshQuestionUserSavesSuccessAction(questionUserSaves: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const RefreshQuestionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}
void saveQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is SaveQuestionAction){
    QuestionUserSaveService()
      .create(action.question.id)
      .then((response) => store.dispatch(SaveQuestionSuccessAction(
        questionUserSave: QuestionUserSaveState.create(response.id, action.question)
      )));
  }
  next(action);
}
void unsaveQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UnsaveQuestionAction){
    QuestionUserSaveService()
      .delete(action.question.id)
      .then((_) => store.dispatch(UnsaveQuestionSuccessAction(question: action.question)));
  }
  next(action);
}
//questionUserSaves

//home page questions
void nextHomePageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextHomePageQuestionsAction){
    final pagination = selectHomePageQuestionPagination(store);
    QuestionService()
      .getHomePageQuestions(pagination.next)
      .then((questions) => store.dispatch(NextHomePageQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const NextHomePageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshHomePageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshHomePageQuestionsAction){
    final pagination = selectHomePageQuestionPagination(store);
    QuestionService()
      .getHomePageQuestions(pagination.first)
      .then((questions) => store.dispatch(RefreshHomePageQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const RefreshHomePageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//home page questions

//user questions
void nextUserQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserQuestionsAction){
    final pagination = selectUserQuestions(store,action.userId);
    QuestionService()
      .getByUserId(action.userId, pagination.next)
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
    final pagination = selectUserQuestions(store,action.userId);
    QuestionService()
      .getByUserId(action.userId, pagination.first)
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
    final pagination = selectUserSolvedQuestions(store,action.userId);
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions) => store.dispatch(NextUserSolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(NextUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserSolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserSolvedQuestionsAction){
    final pagination = selectUserSolvedQuestions(store,action.userId);
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.first)
      .then((questions) => store.dispatch(RefreshUserSolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
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
    final pagination = selectUserUnsolvedQuestions(store,action.userId);
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.next)
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
    final pagination = selectUserUnsolvedQuestions(store,action.userId);
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.first)
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
    final pagination = selectExamQuestions(store, action.examId);
    QuestionService()
      .getByExamId(action.examId, pagination.next)
      .then((questions) => store.dispatch(NextExamQuestionsSuccessAction(
        examId: action.examId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(NextExamQuestionsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
void refreshExamQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshExamQuestionsAction){
    final pagination = selectExamQuestions(store, action.examId);
    QuestionService()
      .getByExamId(action.examId, pagination.first)
      .then((questions) => store.dispatch(RefreshExamQuestionsSuccessAction(
        examId: action.examId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
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
    final pagination = selectSubjectQuestions(store, action.subjectId);
    QuestionService()
      .getBySubjectId(action.subjectId, pagination.next)
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
    final pagination = selectSubjectQuestions(store, action.subjectId);
    QuestionService()
      .getBySubjectId(action.subjectId, pagination.first)
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
    final pagination = selectTopicQuestions(store, action.topicId);
    QuestionService()
      .getByTopicId(action.topicId, pagination.next)
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
    final pagination = selectTopicQuestions(store, action.topicId);
    QuestionService()
      .getByTopicId(action.topicId, pagination.first)
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

//video questions
void nextVideoQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextVideoQuestionsAction){
    QuestionService()
      .getVideoQuestions(selectVideoQuestions(store).next)
      .then((questions) => store.dispatch(NextVideoQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
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
      .then((questions) => store.dispatch(RefreshVideoQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const RefreshVideoQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//video questions