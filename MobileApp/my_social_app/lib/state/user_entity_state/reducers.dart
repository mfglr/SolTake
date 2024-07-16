import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

UserEntityState loadUserReducer(UserEntityState oldState,Action action)
  => action is UserSuccessfullyLoadedAction ? oldState.loadUser(action.payload) : oldState;

UserEntityState loadUsersReducer(UserEntityState oldState,Action action)
  => action is UsersSuccessfullyLoadedAction ? oldState.loadUsers(action.payload) : oldState;

UserEntityState loadFollowersReducer(UserEntityState oldState,Action action)
  => action is FollowersSuccessfullyLoadedAction ? oldState.loadFollowers(action.userId,action.payload) : oldState;

UserEntityState loadFollowedsReducer(UserEntityState oldState,Action action)
  => action is FollowedsSuccessfullyLoadedAction ? oldState.loadFolloweds(action.userId,action.payload) : oldState;

UserEntityState loadQuestionsReducers(UserEntityState oldState,Action action)
  => action is LoadUserQuestionsAction ? oldState.loadQuestions(action.userId,action.payload) : oldState;

UserEntityState startloadingUserImageReducer(UserEntityState oldState,Action action)
  => action is LoadUserImageAction ? oldState.startLoadingUserImage(action.userId) : oldState;

UserEntityState loadUserImageReducer(UserEntityState oldState,Action action)
  => action is UserImageSuccessfullyloadedAction ? oldState.loadUserImage(action.userId, action.paylaod) : oldState;

UserEntityState makeFollowRequestReducer(UserEntityState oldState, Action action)
  => action is FollowRequestSuccessfullyIsMadeAction ? oldState.makeFollowRequest(action.currentUserId, action.userId) : oldState;

UserEntityState cancelFollowRequestReducer(UserEntityState oldState, Action action)
  => action is FollowRequestSuccessfullyCancelledAction ? oldState.cancelFollowRequest(action.currentUserId, action.userId) : oldState;

//Questions
UserEntityState addQuestionReducer(UserEntityState oldState, Action action)
  => action is AddQuestionAction ? oldState.addQuestion(action.currentUserId, action.questionId) : oldState;

Reducer<UserEntityState> userEntityStateReducers = combineReducers<UserEntityState>([
  TypedReducer<UserEntityState,UserSuccessfullyLoadedAction>(loadUserReducer).call,
  TypedReducer<UserEntityState,UsersSuccessfullyLoadedAction>(loadUsersReducer).call,
  TypedReducer<UserEntityState,FollowersSuccessfullyLoadedAction>(loadFollowersReducer).call,
  TypedReducer<UserEntityState,FollowedsSuccessfullyLoadedAction>(loadFollowedsReducer).call,
  TypedReducer<UserEntityState,LoadUserQuestionsAction>(loadQuestionsReducers).call,
  TypedReducer<UserEntityState,LoadUserImageAction>(startloadingUserImageReducer).call,
  TypedReducer<UserEntityState,UserImageSuccessfullyloadedAction>(loadUserImageReducer).call,
  TypedReducer<UserEntityState,FollowRequestSuccessfullyIsMadeAction>(makeFollowRequestReducer).call,
  TypedReducer<UserEntityState,FollowRequestSuccessfullyCancelledAction>(cancelFollowRequestReducer).call,
  TypedReducer<UserEntityState,AddQuestionAction>(addQuestionReducer).call,
]);