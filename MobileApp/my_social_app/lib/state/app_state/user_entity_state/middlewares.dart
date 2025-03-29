import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/services/follow_service.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void loadUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserAction){
    if(store.state.userEntityState.getValue(action.userId) == null){
      UserService()
        .getById(action.userId)
        .then((user) => store.dispatch(AddUserAction(user: user.toUserState())));
    }
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    final user = store.state.userEntityState.get((e) => e.userName == action.userName);
    if(user == null){
      UserService()
        .getByUserName(action.userName)
        .then((user) => store.dispatch(AddUserAction(user: user.toUserState())));
    }
  }
  next(action);
}

void followMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FollowUserAction){
    FollowService()
      .follow(action.followedId)
      .then((response){
        store.dispatch(FollowUserSuccessAction(
          currentUserId: store.state.loginState!.id,
          followedId: action.followedId,
          followId: response.id
        ));
      });
  }
  next(action);
}
void unfollowMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnfollowUserAction){
    FollowService()
      .unfollow(action.followedId)
      .then((_) => store.dispatch(UnfollowUserSuccessAction(
        currentUserId: store.state.loginState!.id,
        followedId: action.followedId
      )));
  }
  next(action);
}
void removeFollowerMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveFollowerAction){
    FollowService()
      .removeFollower(action.followerId)
      .then((_) => store.dispatch(RemoveFollowerSuccessAction(currentUserId: store.state.loginState!.id,followerId: action.followerId)));
  }
  next(action);
}

void updateUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserNameAction){
    UserService()
      .updateUserName(action.userName)
      .then((_){
        store.dispatch(UpdateUserNameSuccessAction(userId: store.state.loginState!.id, userName: action.userName));
        ToastCreator.displaySuccess(userNameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateNameAction){
    UserService()
      .updateName(action.name)
      .then((_){
        store.dispatch(UpdateNameSuccessAction(userId: store.state.loginState!.id, name: action.name));
        ToastCreator.displaySuccess(nameUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void updateBiographyMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateBiographyAction){
    final accountId = store.state.loginState!.id;
    UserService()
      .updateBiography(action.biography)
      .then((_){
        store.dispatch(UpdateBiographySuccessAction(userId: accountId, biography: action.biography));
        ToastCreator.displaySuccess(biographyUpdatedNotificationContent[getLanguageByStore(store)]!);
      });
  }
  next(action);
}
void uploadUserImageMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UploadUserImageAction){
    UserService()
      .updateImage(
        action.image,
        action.userId,
        (rate) => store.dispatch(ChangeUserImageRateAction(userId: action.userId, rate: rate))
      )
      .then((image) => store.dispatch(UploadUserImageSuccessAction(userId: action.userId, image: image)))
      .catchError((e){
        store.dispatch(UploadUserImageFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void removeUserImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveUserImageAction){
    UserService()
      .removeImage(action.userId)
      .then((_) => store.dispatch(RemoveUserImageSuccessAction(userId: action.userId)));
  }
  next(action);
}

void nextUserFollowersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowersAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.followers;
    FollowService()
      .getFollowersByUserId(action.userId, pagination.next)
      .then((followers) => store.dispatch(NextUserFollowersSuccessAction(userId: action.userId,followers: followers.map((e) => e.toFollowState()))))
      .catchError((e){
        store.dispatch(NextUserFollowersFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowedsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.followeds;
    FollowService()
      .getFollowedsByUserId(action.userId,pagination.next)
      .then((followeds) => store.dispatch(NextUserFollowedsSuccessAction(userId: action.userId,followeds: followeds.map((e) => e.toFollowState()))))
      .catchError((e){
        store.dispatch(NextuserFollowedsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}

void nextUserQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserQuestionsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.questions;
    QuestionService()
      .getByUserId(action.userId,pagination.next)
      .then((questions){
        store.dispatch(NextUserQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((e) => Id(id: e.id))));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(NextUserQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserSolvedQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserSolvedQuestionsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.solvedQuestions;
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(NextUserSolvedQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((question) => question.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(NextUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserUnsolvedQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserUnsolvedQuestionsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.unsolvedQuestions;
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(NextUserUnsolvedQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(NextUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}

void nextUserConvesationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserConversationsAction){
    final pagination = store.state.userEntityState.getValue(action.userId)!.conversations;
    UserService()
      .getCreateConversationPageUsers(pagination.next)
      .then((users){
        store.dispatch(NextUserConversationsSuccessAction(userId: store.state.loginState!.id, ids: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
      })
      .catchError((e){
        store.dispatch(NextUserConversationsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
