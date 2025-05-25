import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/question_user_like_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/draft_questions/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/selectors.dart';
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


void _loadQuestion(Store<AppState> store, int questionId, void Function() callback){
  if(selectQuestion(store,questionId) == null){
    QuestionService()
      .getById(questionId)
      .then((question){
        store.dispatch(AddQuestionAction(value: question.toQuestionState()));
        callback();
      });
  }
  else{
    callback();
  }
}


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
        store.dispatch(AddDraftQuestionAction(questionId: question.id));
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
void _nextQuestionLikes(Store<AppState> store,NextQuestionLikesAction action){
  QuestionUserLikeService()
    .getQuestionLikes(action.questionId, selectQuestionNextLikesPage(store, action.questionId))
    .then(
      (likes) =>
        store.dispatch(
          NextQuestionLikesSuccessAction(questionId: action.questionId,likes: likes.map((e) => e.toQuestionUserLikeState()))
        )
    )
    .catchError((e){
      store.dispatch(NextQuestionLikesFailedAction(questionId: action.questionId));
      throw e;
    });
}
void nextQuestionLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionLikesAction){
    if(selectQuestion(store, action.questionId) == null){
      QuestionService()
        .getById(action.questionId)
        .then((question){
          store.dispatch(AddQuestionAction(value: question.toQuestionState()));
          _nextQuestionLikes(store,action);
        });
    }
    else{
      _nextQuestionLikes(store,action);
    }
  }
  next(action);
}

void likeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LikeQuestionAction){
    QuestionUserLikeService()
      .like(action.questionId)
      .then((questionUserLike) =>
        store.dispatch(
          LikeQuestionSuccessAction(
            questionId: action.questionId,
            like: questionUserLike.toQuestionUserLikeState()
          )
        )
      );
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionUserLikeService()
      .dislike(action.questionId)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(questionId: action.questionId,userId: store.state.login.login!.id)));
  }
  next(action);
}
//question likes;

void nextQuestionSolutionsMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is NextQuestionSolutionsAction){
    SolutionService()
      .getSolutionsByQuestionId(action.questionId,selectQuestionNextSolutionsPage(store, action.questionId))
      .then((solutions){
        store.dispatch(NextQuestionSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(NextQuestionSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void nextQuestionCorrectSolutionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionCorrectSolutionsAction){
    final pagination = store.state.questionEntityState.getValue(action.questionId)!.correctSolutions;
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionCorrectSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(NextQuestionCorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void nextQuestionPendingSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionPendingSolutionsAction){
    final pagination = store.state.questionEntityState.getValue(action.questionId)!.pendingSolutions;
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionPendingSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(NextQuestionPendingSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void nextQuestionIncorrectSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionIncorrectSolutionsAction){
    final pagination = store.state.questionEntityState.getValue(action.questionId)!.incorrectSolutions;
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionIncorrectSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
      })
      .catchError((e){
        store.dispatch(NextQuestionIncorrectSolutionsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
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

void nextQuestionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionCommentsAction){
    _loadQuestion(
      store,
      action.questionId,
      () =>
        CommentService()
          .getCommentsByQuestionId(action.questionId, selectQuestionNextCommentsPage(store, action.questionId))
          .then((comments){
            store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
            store.dispatch(NexQuestionCommentsSuccessAction(questionId: action.questionId,commentIds: comments.map((e) => e.id)));
          })
          .catchError((e){
            store.dispatch(NextQuestionCommentsFailedAction(questionId: action.questionId));
            throw e;
          })
    );
    
  }
  next(action);
}
void prevQuestionCommentsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevQuestionCommentsAction){
    _loadQuestion(
      store,
      action.questionId,
      () => 
        CommentService()
          .getCommentsByQuestionId(action.questionId, selectQuestionPrevCommentsPage(store,action.questionId))
          .then((comments){
            store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
            store.dispatch(PrevQuestionCommentsSuccessAction(questionId: action.questionId,commentIds: comments.map((e) => e.id)));
          })
          .catchError((e){
            store.dispatch(PrevQuestionCommentsFailedAction(questionId: action.questionId));
            throw e;
          })
    );
  }
  next(action);
}

