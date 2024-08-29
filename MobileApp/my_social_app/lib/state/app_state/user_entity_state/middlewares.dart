import 'package:collection/collection.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
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

void getNextPageUserFollowersIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowersIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followers;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserFollowersAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserFollowersIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowersIfReadyAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followers;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserFollowersAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserFollowersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowersAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followers;
    UserService()
      .getFollowersById(action.userId, pagination.next)
      .then((follows){
        store.dispatch(AddNextPageUserFollowersAction(userId: action.userId,followIds: follows.map((e) => e.id)));
        store.dispatch(AddFollowsAction(follows: follows.map((e) => e.toFollowState())));
        store.dispatch(AddUsersAction(users: follows.map((e) => e.follower!.toUserState())));
        store.dispatch(AddUserImagesAction(images: follows.map((e) => UserImageState.init(e.followerId))));
      });
  }
  next(action);
}

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

void getNextPageUserFollowedsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowedsIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followeds;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserFollowedsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserFollowedsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowedsIfReadyAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followeds;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserFollowedsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserFollowedsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.followeds;
    UserService()
      .getFollowedsById(action.userId,pagination.next)
      .then((follows){
        store.dispatch(AddNextPageUserFollowedsAction(userId: action.userId,followIds: follows.map((e) => e.id)));
        store.dispatch(AddFollowsAction(follows: follows.map((e) => e.toFollowState())));
        store.dispatch(AddUsersAction(users: follows.map((e) => e.followed!.toUserState())));
        store.dispatch(AddUserImagesAction(images: follows.map((e) => UserImageState.init(e.followed!.id))));
      }
    );
  }
  next(action);
}

void getNextPageUserMessageIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserMessagesIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.messages;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserMessagesAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserMessageIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserMessagesIfReadyAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.messages;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserMessagesAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserMessagesAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.messages;
    MessageService()
      .getMessagesByUserId(action.userId, pagination.next)
      .then((messages){
        store.dispatch(AddNextPageUserMessagesAction(userId: action.userId,messageIds: messages.map((message) => message.id)));
        store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
      });
  }
  next(action);
}

void getNextPageUserQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserQuestionsIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.questions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserQuestionsIfReadyAction){
   final pagination = store.state.userEntityState.entities[action.userId]!.questions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void nextPageOfUserQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserQuestionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.questions;
    QuestionService()
      .getByUserId(action.userId,pagination.next)
      .then((questions){
        store.dispatch(AddNextPageUserQuestionsAction(userId: action.userId,questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void getNextPageUserSolvedQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserSolvedQuestionsIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.solvedQuestions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserSolvedQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserSolvedQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserSolvedQuestionsIfReadyAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.solvedQuestions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserSolvedQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserSolvedQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserSolvedQuestionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.solvedQuestions;
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(AddNextPageUserSolvedQuestionsAction(userId: action.userId,questionIds: questions.map((question) => question.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void getNextPageUserUnsolvedQuestionsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserUnsolvedQuestionsIfNoPageAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.unsolvedQuestions;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(GetNextPageUserUnsolvedQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserUnsolvedQuestionsIfReadyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserUnsolvedQuestionsIfReadyAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.unsolvedQuestions;
    if(pagination.isReadyForNextPage){
      store.dispatch(GetNextPageUserUnsolvedQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}
void getNextPageUserUnsolvedQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageUserUnsolvedQuestionsAction){
    final pagination = store.state.userEntityState.entities[action.userId]!.unsolvedQuestions;
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions){
        store.dispatch(AddNextPageUserUnsolvedQuestionsAction(userId: action.userId,questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      });
  }
  next(action);
}

void followMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FollowAction){
    final followerId = store.state.accountState!.id;
    final followedId = action.followedId;
    UserService()
      .follow(action.followedId)
      .then((follow){
        store.dispatch(AddFollowAction(follow: follow.toFollowState()));
        store.dispatch(AddUserFollowerAction(userId: followedId, followId: follow.id));
        store.dispatch(AddUserFollowedAction(userId: followerId, followId: follow.id));
        store.dispatch(RemoveUserNotFollowedAction(userId: followerId, notFollowedId: followedId));
      });
  }
  next(action);
}
void unfollowMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is UnfollowAction){
    final followerId = store.state.accountState!.id;
    final followedId = action.followedId;
    UserService()
      .unfollow(action.followedId)
      .then((_){
        store.dispatch(AddUserNotFollowedAction(userId: followerId, notFollowedId: followedId));
        final follow = store.state.followEntityState.select(followerId, followedId);
        if(follow == null) return;
        store.dispatch(RemoveFollowAction(followId: follow.id));
        store.dispatch(RemoveUserFollowerAction(userId: followedId, followId: follow.id));
        store.dispatch(RemoveUserFollowedAction(userId: followerId, followId: follow.id));
      });
  }
  next(action);
}
void deleteFollowerMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteFollowerAction){
    final followerId = action.followerId;
    final followedId = store.state.accountState!.id;
    UserService()
      .removeFollower(action.followerId)
      .then((_){
        final follow = store.state.followEntityState.select(followerId, followedId);
        if(follow == null) return;
        store.dispatch(RemoveUserFollowerAction(userId: followedId, followId: follow.id));
        store.dispatch(RemoveUserFollowedAction(userId: followerId, followId: follow.id));
        store.dispatch(RemoveFollowAction(followId: follow.id));
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
        ToastCreator.displaySuccess("Your user name has been successfully updated.");
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
        ToastCreator.displaySuccess("Yout name has been successfully updated.");
      });
  }
  next(action);
}

