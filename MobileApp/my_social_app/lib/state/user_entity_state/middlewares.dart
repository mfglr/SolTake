import 'package:collection/collection.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadUserMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUserAction){
    if(store.state.userEntityState.entities[action.userId] == null){
      UserService()
        .getById(action.userId)
        .then((user){
          store.dispatch(
            LoadUserSuccessAction(
              user: user.toUserState()
            )
          );
          store.dispatch(
            AddUserImageAction(
              image: UserImageState(id: user.id,image: null,state: ImageStatus.notStarted)
            )
          );
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
          store.dispatch(
            LoadUserSuccessAction(
              user: user.toUserState()
            )
          );
          store.dispatch(
            AddUserImageAction(
              image: UserImageState(id: user.id,image: null,state: ImageStatus.notStarted)
            )
          );
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
      .getFollowersById(action.userId,pagination.lastValue,usersPerPage)
      .then((users){
        store.dispatch(AddNextPageUserFollowersAction(userId: action.userId, userIds: users.map((e) => e.id)));
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
      .getFollowedsById(action.userId,pagination.lastValue,usersPerPage)
      .then((users){
        store.dispatch(AddNextPageUserFollowedsAction(userId: action.userId,userIds:users.map((user) => user.id)));
        store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
        store.dispatch(AddUserImagesAction(images: users.map((e) => UserImageState.init(e.id))));
      }
    );
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
    final questions = store.state.userEntityState.entities[action.userId]!.questions;
    if(!questions.isLast){
      QuestionService()
        .getByUserId(action.userId,questions.lastValue,questionsPerPage)
        .then((questions){
          store.dispatch(AddNextPageUserQuestionsAction(userId: action.userId,userIds: questions.map((e) => e.id)));
          store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
          store.dispatch(AddQuestionImagesListAction(lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))));
          store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
          store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
          store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
          store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
        });
    }
  }
  next(action);
}

void makeFollowRequestMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MakeFollowRequestAction){
    final currentUserId = store.state.accountState!.id;
    UserService()
      .makeFollowRequest(action.userId)
      .then((_) => store.dispatch(MakeFollowRequestSuccessAction(currentUserId: currentUserId, userId: action.userId)));
  }
  next(action);
}
void cancelFollowRequestMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CancelFollowRequestAction){
    final currentUserId = store.state.accountState!.id;
    UserService()
      .cancelFollowRequest(action.userId)
      .then((_) => store.dispatch(CancelFollowRequestSuccessAction(currentUserId: currentUserId, userId: action.userId)));
  }
  next(action);
}

void nextPageUserMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageUserMessagesAction){
    if(!store.state.userEntityState.entities[action.userId]!.isLastMessages){
      final lastValue = store.state.messageEntityState.selectLastMessageId(action.userId);
      MessageService()
        .getMessagesByUserId(action.userId, lastValue, messagesPerPage)
        .then((messages){
          store.dispatch(
            NextPageUserMessagesSuccessAction(
              userId: action.userId,
              messages: messages
            )
          );
          store.dispatch(
            AddMessagesAction(
              messages: messages.map((e) => e.toMessageState())
            )
          );
        });
    }
  }
  next(action);
}
void nextPageUserMessageIfNoUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageUserMessagesIfNoMessagesAction){
    final count = store.state.messageEntityState.selectNumberUserMessages(action.userId);
    if(count < messagesPerPage){
      store.dispatch(NextPageUserMessagesAction(userId: action.userId));
    }
  }
  next(action);
}