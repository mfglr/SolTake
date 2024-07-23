import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
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
              user: UserState.init(user)
            )
          );

          store.dispatch(
            AddUserImageAction(
              image: UserImageState(id: user.id,image: null,state: ImageState.notLoaded)
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
      final lastId = user.followers.lastId;
      UserService()
        .getFollowersById(action.userId,lastId: lastId)
        .then((users){
          store.dispatch(
            LoadFollowersSuccessAction(
              userId: action.userId,
              payload: users.map((user) => UserState.init(user))
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notLoaded)) 
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
      final lastId = store.state.userEntityState.entities[action.userId]!.followers.lastId;
      UserService()
        .getFollowersById(action.userId,lastId: lastId)
        .then((users){
          store.dispatch(
            LoadFollowersSuccessAction(
              userId: action.userId,
              payload:users.map((user) => UserState.init(user)).toList()
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notLoaded)) 
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
      final lastId = user.followeds.lastId;
      UserService()
        .getFollowedsById(action.userId,lastId: lastId)
        .then((users){
          store.dispatch(
            LoadFollowedsSuccessAction(
              userId: action.userId,
              payload:users.map((user) => UserState.init(user)).toList()
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notLoaded)) 
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
      final lastId = store.state.userEntityState.entities[action.userId]!.followers.lastId;
      UserService()
        .getFollowedsById(action.userId,lastId: lastId)
        .then((users){
          store.dispatch(
            LoadFollowedsSuccessAction(
              userId: action.userId,
              payload:users.map((user) => UserState.init(user)).toList()
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(id: e.id,image: null,state: ImageState.notLoaded)) 
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
    final user = store.state.userEntityState.entities[action.userId]!;
    if(!user.questions.isLast){
      QuestionService()
        .getByUserId(action.userId,lastId: user.questions.lastId)
        .then((questions){
          store.dispatch(
            AddQuestionsAction(
              questions: questions.map((e) => e.toQuestionState())
            )
          );

          store.dispatch(
            AddQuestionImagesListAction(
              lists: questions.map((e) => e.images.map((e) => e.toQuestionImageState()))
            )
          );

          store.dispatch(
            AddUserImagesAction(
              images: questions.map((e) => UserImageState(id: e.appUserId,image: null,state: ImageState.notLoaded)) 
            )
          );

          store.dispatch(
            NextPageOfUserQuestionsSuccessAction(
              userId: action.userId,
              payload: questions.map((e) => e.id)
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