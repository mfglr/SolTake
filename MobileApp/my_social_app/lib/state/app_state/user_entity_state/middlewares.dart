import 'package:collection/collection.dart';
import 'package:my_social_app/constants/notifications_content.dart';
import 'package:my_social_app/helpers/get_language_code.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:redux/redux.dart';

void loadUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserAction){
    if(store.state.userEntityState.entities[action.userId] == null){
      UserService()
        .getById(action.userId)
        .then((user){
          store.dispatch(AddUserAction(user: user.toUserState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(user.id)));
        });
    }
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    final user = store.state.userEntityState.entities.values.where((e) => e.userName == action.userName).firstOrNull;
    if(user == null){
      UserService()
        .getByUserName(action.userName)
        .then((user){
          store.dispatch(AddUserAction(user: user.toUserState()));
          store.dispatch(AddUserImageAction(image: UserImageState.init(user.id)));
        });
    }
  }
  next(action);
}
void followMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FollowUserAction){
    final currentUserId = store.state.accountState!.id;
    UserService()
      .follow(action.followedId)
      .then((follow){
        store.dispatch(AddFollowAction(follow: follow.toFollowState()));
        store.dispatch(FollowUserSuccessAction(currentUserId: currentUserId, followedId: action.followedId, followId: follow.id));
      });
  }
  next(action);
}
void unfollowMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnfollowUserAction){
    final currentUserId = store.state.accountState!.id;
    UserService()
      .unfollow(action.followedId)
      .then((_){
        final followId = store.state.followEntityState.select(currentUserId, action.followedId)?.id ?? 0;
        store.dispatch(RemoveFollowAction(followId: followId));
        store.dispatch(UnfollowUserSuccessAction(currentUserId: currentUserId, followedId: action.followedId, followId: followId));
      });
  }
  next(action);
}
void removeFollowerMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveFollowerAction){
    final followerId = action.followerId;
    final currentUserId = store.state.accountState!.id;
    UserService()
      .removeFollower(action.followerId)
      .then((_){
        final followId = store.state.followEntityState.select(followerId, currentUserId)?.id ?? 0;
        store.dispatch(RemoveFollowAction(followId: followId));
        store.dispatch(RemoveFollowerSuccessAction(currentUserId: currentUserId,followerId: followerId,followId: followId));
      });
  }
  next(action);
}

void updateUserNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateUserNameAction){
    final accountId = store.state.accountState!.id;
    AccountService()
      .updateUserName(action.userName)
      .then((_){
        store.dispatch(UpdateUserNameSuccessAction(userId: accountId, userName: action.userName));
        ToastCreator.displaySuccess(userNameUpdatedNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}
void updateNameMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateNameAction){
    final accountId = store.state.accountState!.id;
    UserService()
      .updateName(action.name)
      .then((_){
        store.dispatch(UpdateNameSuccessAction(userId: accountId, name: action.name));
        ToastCreator.displaySuccess(nameUpdatedNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}
void updateBiographyMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UpdateBiographyAction){
    final accountId = store.state.accountState!.id;
    UserService()
      .updateBiography(action.biography)
      .then((_){
        store.dispatch(UpdateBiographySuccessAction(userId: accountId, biography: action.biography));
        ToastCreator.displaySuccess(biographyUpdatedNotificationContent[getLanguageCode(store)]!);
      });
  }
  next(action);
}

void nextUserFollowersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowersAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followers;
    UserService()
      .getFollowersById(action.userId, pagination.next)
      .then((follows){
        store.dispatch(NextUserFollowersSuccessAction(userId: action.userId,followIds: follows.map((e) => e.id)));
        store.dispatch(AddFollowsAction(follows: follows.map((e) => e.toFollowState())));
        store.dispatch(AddUsersAction(users: follows.map((e) => e.follower!.toUserState())));
        store.dispatch(AddUserImagesAction(images: follows.map((e) => UserImageState.init(e.followerId))));
      })
      .catchError((e){
        store.dispatch(NextUserFollowersFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserFollowedsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followeds;
    UserService()
      .getFollowedsById(action.userId,pagination.next)
      .then((follows){
        store.dispatch(NextUserFollowedsSuccessAction(userId: action.userId,followIds: follows.map((e) => e.id)));
        store.dispatch(AddFollowsAction(follows: follows.map((e) => e.toFollowState())));
        store.dispatch(AddUsersAction(users: follows.map((e) => e.followed!.toUserState())));
        store.dispatch(AddUserImagesAction(images: follows.map((e) => UserImageState.init(e.followed!.id))));
      })
      .catchError((e){
        store.dispatch(NextuserFollowedsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserMessagesAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.messages;
    MessageService()
      .getMessagesByUserId(action.userId, pagination.next)
      .then((messages){
        store.dispatch(NextUserMessagesSuccessAction(userId: action.userId,messageIds: messages.map((message) => message.id)));
        store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
        store.dispatch(AddMessageImagesListAction(list: messages.map(
          (e) => List.generate(e.numberOfImages, (index) => MessageImageState.init(e.id, index)))
        ));
      })
      .catchError((e){
        store.dispatch(NextUserMessagesFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserQuestionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.questions;
    QuestionService()
      .getByUserId(action.userId,pagination.next)
      .then((questions){
        store.dispatch(NextUserQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.userId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
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
    final pagination = store.state.userEntityState.entities[action.userId]!.solvedQuestions;
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(NextUserSolvedQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((question) => question.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.userId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
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
    final pagination = store.state.userEntityState.entities[action.userId]!.unsolvedQuestions;
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(NextUserUnsolvedQuestionsSuccessAction(userId: action.userId,questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.userId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        var topics = questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(NextUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserSavedQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserSavedQuestionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.savedQuestions;
    QuestionService()
      .getSavedQuestions(pagination.next)
      .then((saves){
        store.dispatch(NextUserSavedQuestionsSuccessAction(userId: action.userId,savedIds: saves.map((e) => e.id)));
        store.dispatch(AddUserImagesAction(images: saves.map((e) => UserImageState.init(e.question!.userId))));
        store.dispatch(AddQuestionsAction(questions: saves.map((e) => e.question!.toQuestionState())));
        store.dispatch(AddQuestionUserSavesAction(saves: saves.map((e) => e.toQuestionUserSaveState())));
        store.dispatch(AddExamsAction(exams: saves.map((e) => e.question!.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: saves.map((e) => e.question!.subject.toSubjectState())));
        var topics = saves.map((e) => e.question!.topic).where((e) => e != null).map((e) => e!.toTopicState());
        store.dispatch(AddTopicsAction(topics: topics));
      })
      .catchError((e){
        store.dispatch(NextUserSavedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void nextUserSavedSolutionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserSavedSolutionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.savedSolutions;
    SolutionService()
      .getSavedSolutions(pagination.next)
      .then((saves){
        store.dispatch(AddSolutionUserSavesAction(saves: saves.map((e) => e.toSolutionUserSaveState())));
        store.dispatch(AddSolutionsAction(solutions: saves.map((e) => e.solution!.toSolutionState())));
        store.dispatch(AddUserImagesAction(images: saves.map((e) => UserImageState.init(e.solution!.userId))));
        store.dispatch(NextUserSavedSolutionsSuccessAction(userId: action.userId,savedIds: saves.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextUserSavedSolutionsFailedAction(userId: action.userId));        
        throw e;
      });
  }
  next(action);
}
void nextUserConvesationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserConversationsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.conversations;
    UserService()
      .getCreateConversationPageUsers(pagination.next)
      .then((users){
        store.dispatch(NextUserConversationsSuccessAction(userId: store.state.accountState!.id, ids: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      })
      .catchError((e){
        store.dispatch(NextUserConversationsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}

//not followeds
void getNextPageUserNotFollowedsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserNotFollowedsIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.notFolloweds;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserNotFollowedsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserNotFollowedsIfReadyMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is GetNextPageUserNotFollowedsIfReadyAction){
    final accountId = store.state.accountState!.id;
    final pagination = store.state.userEntityState.entities[accountId]!.notFolloweds;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserNotFollowedsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserNotFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserNotFollowedsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.notFolloweds;
    UserService()
      .getNotFolloweds(action.userId, pagination.next)
      .then((users){
        store.dispatch(AddNextPageUserNotFollowedsAction(userId: action.userId,userIds: users.map((e) => e.id)));
        store.dispatch(AddUsersAction(users: users.map((user) => user.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      });
  }
  next(action);
}

