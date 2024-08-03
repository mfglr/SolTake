import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/image_state.dart';
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
              image: UserImageState(id: user.id,image: null,state: ImageState.notStarted)
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
              image: UserImageState(id: user.id,image: null,state: ImageState.notStarted)
            )
          );
        });
    }
  }
  next(action);
}

void loadFollowersIfNoUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadFollowersIfNoUsersAction){
    final user = store.state.userEntityState.entities[action.userId]!;
    if(!user.followers.isLast && user.followers.ids.isEmpty){
      final lastValue = user.followers.lastValue;
      UserService()
        .getFollowersById(action.userId,lastValue: lastValue)
        .then((users){
          store.dispatch(
            LoadFollowersSuccessAction(
              userId: action.userId,
              payload: users.map((user) => user.toUserState())
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notStarted)) 
            )
          );
        });
    }
  }
  next(action);
}
void loadFollowersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadFollowersAction){
    if(!store.state.userEntityState.entities[action.userId]!.followers.isLast){
      final lastValue = store.state.userEntityState.entities[action.userId]!.followers.lastValue;
      UserService()
        .getFollowersById(action.userId,lastValue: lastValue)
        .then((users){
          store.dispatch(
            LoadFollowersSuccessAction(
              userId: action.userId,
              payload:users.map((user) => user.toUserState())
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notStarted)) 
            )
          );
        });
    }
  }
  next(action);
}

void loadFollowedsIfNoUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadFollowedsIfNoUsersAction){
    final user = store.state.userEntityState.entities[action.userId]!;
    if(!user.followeds.isLast && user.followeds.ids.isEmpty){
      final lastValue = user.followeds.lastValue;
      UserService()
        .getFollowedsById(action.userId,lastValue: lastValue)
        .then((users){
          store.dispatch(
            LoadFollowedsSuccessAction(
              userId: action.userId,
              payload:users.map((user) => user.toUserState())
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notStarted)) 
            )
          );
        });
    }
  }
  next(action);
}
void loadFollowedsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadFollowersAction){
    if(!store.state.userEntityState.entities[action.userId]!.followeds.isLast){
      final lastValue = store.state.userEntityState.entities[action.userId]!.followers.lastValue;
      UserService()
        .getFollowedsById(action.userId,lastValue: lastValue)
        .then((users){
          store.dispatch(
            LoadFollowedsSuccessAction(
              userId: action.userId,
              payload:users.map((user) => user.toUserState())
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notStarted)) 
            )
          );
        }
      );
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

void nextPageOfUserQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfUserQuestionsAction){
    final questions = store.state.userEntityState.entities[action.userId]!.questions;
    if(!questions.isLast){
      QuestionService()
        .getByUserId(action.userId,lastValue: questions.lastValue)
        .then((questions){
          store.dispatch(
            AddQuestionsAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );

          store.dispatch(
            NextPageOfUserQuestionsSuccessAction(
              userId: action.userId,
              payload: questions.map((e) => e.id)
            )
          );

          store.dispatch(
            AddQuestionImagesListAction(
              lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: questions.map((e) => UserImageState(id: e.appUserId,image: null,state: ImageState.notStarted)) 
            )
          );

          store.dispatch(
            AddExamsAction(
              exams: questions.map((e) => e.exam.toExamState()) 
            )
          );

          store.dispatch(
            AddSubjectsAction(
              subjects: questions.map((e) => e.subject.toSubjectState())
            )
          );

          store.dispatch(
            AddTopicsListAction(
              lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))
            )
          );
        });
    }
  }
  next(action);
}
void nextPageOfUserQuestionsIfNoQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfUserQuestionsIfNoQuestionsAction){
    final questions = store.state.userEntityState.entities[action.userId]!.questions;
    if(!questions.isLast && questions.ids.isEmpty){
      store.dispatch(NextPageOfUserQuestionsAction(userId: action.userId));
    }
  }
  next(action);
}

void nextPageUserMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageUserMessagesAction){
    final messages = store.state.userEntityState.entities[action.userId]!.messages;
    if(!messages.isLast){
      MessageService()
        .getMessagesByUserId(action.userId, messages.lastValue, messagesPerPage)
        .then((messages){
          store.dispatch(
            NextPageUserMessagesSuccessAction(
              userId: action.userId,
              messageIds: messages.map((e) => e.id)
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
    final messages = store.state.userEntityState.entities[action.userId]!.messages;
    if(messages.ids.length < messagesPerPage){
      store.dispatch(NextPageUserMessagesAction(userId: action.userId));
    }
  }
  next(action);
}