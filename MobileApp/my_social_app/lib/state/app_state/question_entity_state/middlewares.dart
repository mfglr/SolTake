import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/services/comment_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void createQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateQuestionAction){
    ToastCreator.displaySuccess(questionCreationStartedNotificationContent[getLanguageCode(store)]!);
    QuestionService()
      .createQuestion(action.images,action.examId,action.subjectId,action.topicIds,action.content)
      .then((question) {
        store.dispatch(AddQuestionAction(value: question.toQuestionState()));
        store.dispatch(AddNewUserQuestionAction(userId: store.state.accountState!.id,questionId: question.id));
        ToastCreator.displaySuccess(questionCreatedNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}
void loadQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LoadQuestionAction){
    if(store.state.questionEntityState.entities[action.questionId] == null){
      QuestionService()
        .getById(action.questionId)
        .then((question){
          store.dispatch(AddQuestionAction(value: question.toQuestionState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(question.appUserId)));
          store.dispatch(AddExamAction(exam: question.exam.toExamState()));
          store.dispatch(AddSubjectAction(subject: question.subject.toSubjectState()));
          store.dispatch(AddTopicsAction(topics: question.topics.map((e) => e.toTopicState())));
        });
    }
  }
  next(action);
}
void deleteQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteQuestionAction){
    final accountId = store.state.accountState!.id;
    QuestionService()
      .delete(action.questionId)
      .then((_){
        store.dispatch(DeleteQuestionSuccessAction(questionId: action.questionId));
        store.dispatch(RemoveUserQuestionAction(userId: accountId, questionId: action.questionId));
      });
  }
  next(action);
}
void saveQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is SaveQuestionAction){
    final accountId = store.state.accountState!.id;
    QuestionService()
      .save(action.questionId)
      .then((save){
        store.dispatch(SaveQuestionSuccessAction(questionId: action.questionId));
        store.dispatch(AddQuestionUserSaveAction(save: save.toQuestionUserSaveState()));
        store.dispatch(AddUserSavedQuestionAction(userId: accountId, saveId: save.id));
      });
  }
  next(action);
}
void unsaveQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnsaveQuestionAction){
    final accountId = store.state.accountState!.id;
    QuestionService()
      .unsave(action.questionId)
      .then((_){
        final saveId = store.state.questionUserSaveEntityState.select(action.questionId, accountId)?.id ?? 0;
        store.dispatch(UnsaveQuestionSuccessAction(questionId: action.questionId));
        store.dispatch(RemoveQuestionUserSaveAction(saveId: saveId));
        store.dispatch(RemoveUserSavedQuestionAction(userId: accountId, saveId: saveId));
      });
  }
  next(action);
}
void loadQuestionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionImageAction){
    final image = store.state.questionEntityState.entities[action.questionId]!.images.elementAt(action.index);
    if(image.state == ImageStatus.notStarted){
      QuestionService()
        .getQuestionImage(action.questionId, image.id)
        .then((image) => store.dispatch(
            LoadQuestionImageSuccessAction(questionId: action.questionId, index: action.index,image: image)
        ));
    }
  }
  next(action);
}
void likeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LikeQuestionAction){
    QuestionService()
      .like(action.questionId)
      .then((like){
        store.dispatch(LikeQuestionSuccessAction(questionId: action.questionId,likeId: like.id));
        store.dispatch(AddQuestionUserLikeAction(like: like.toQuestionUserLikeState()));
      });
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    final accountId = store.state.accountState!.id;
    QuestionService()
      .dislike(action.questionId)
      .then((_){
        final likeId = store.state.questionUserLikeEntityState.select(action.questionId, accountId)?.id ?? 0;
        store.dispatch(RemoveQuestionUserLikeAction(likeId: likeId));
        store.dispatch(DislikeQuestionSuccessAction(questionId: action.questionId,likeId: likeId));
      });
  }
  next(action);
}

void nextQuestionLikesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionLikesAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.likes;
    QuestionService()
      .getQuestionLikes(action.questionId, pagination.next)
      .then((likes){
        store.dispatch(NextQuestionLikesSuccessAction(questionId: action.questionId,likeIds: likes.map((e) => e.id)));
        store.dispatch(AddQuestionUserLikesAction(likes: likes.map((e) => e.toQuestionUserLikeState())));
        store.dispatch(AddUsersAction(users: likes.map((user) => user.appUser!.toUserState())));
        store.dispatch(AddUserImagesAction(images: likes.map((e) => UserImageState.init(e.appUserId))));
      })
      .catchError((e){
        store.dispatch(NextQuestionLikesFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void nextQuestionSolutionsMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is NextQuestionSolutionsAction){
    final pagination = store.state.questionEntityState.entities[action.questionId]!.solutions;
    SolutionService()
      .getSolutionsByQuestionId(action.questionId,pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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
    final pagination = store.state.questionEntityState.entities[action.questionId]!.correctSolutions;
    SolutionService()
      .getCorrectSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionCorrectSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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
    final pagination = store.state.questionEntityState.entities[action.questionId]!.pendingSolutions;
    SolutionService()
      .getPendingSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionPendingSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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
    final pagination = store.state.questionEntityState.entities[action.questionId]!.incorrectSolutions;
    SolutionService()
      .getIncorrectSolutionsByQuestionId(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionIncorrectSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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
    final pagination = store.state.questionEntityState.entities[action.questionId]!.videoSolutions;
    SolutionService()
      .getVideoSolutions(action.questionId, pagination.next)
      .then((solutions){
        store.dispatch(NextQuestionVideoSolutionsSuccessAction(questionId: action.questionId, solutionIds: solutions.map((e) => e.id)));
        store.dispatch(AddSolutionsAction(solutions: solutions.map((e) => e.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: solutions.map((e) => UserImageState.init(e.appUserId))));
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
    final pagination = store.state.questionEntityState.entities[action.questionId]!.comments;
    CommentService()
      .getCommentsByQuestionId(action.questionId, pagination.next)
      .then((comments){
        store.dispatch(AddCommentsAction(comments: comments.map((e) => e.toCommentState())));
        store.dispatch(AddUserImagesAction(images: comments.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(NexQuestionCommentsSuccessAction(questionId: action.questionId,commentIds: comments.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextQuestionCommentsFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
