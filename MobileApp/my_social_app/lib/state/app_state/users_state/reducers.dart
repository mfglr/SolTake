import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:redux/redux.dart';

UsersState loadUserReducer(UsersState prev, LoadUserAction action) =>
  prev.load(action.id);
UsersState loadUserSuccessReducer(UsersState prev, LoadUserSuccessAction action) =>
  prev.success(action.user);
UsersState loadUserFailedReducer(UsersState prev, LoadUserFailedAction action) =>
  prev.failed(action.id);
UsersState userNotFoundReducer(UsersState prev, UserNotFoundAction action) =>
  prev.notFound(action.id);

Reducer<UsersState> usersReducer = combineReducers<UsersState>([
  TypedReducer<UsersState,LoadUserAction>(loadUserReducer).call,
  TypedReducer<UsersState,LoadUserSuccessAction>(loadUserSuccessReducer).call,
  TypedReducer<UsersState,LoadUserFailedAction>(loadUserFailedReducer).call,
  TypedReducer<UsersState,UserNotFoundAction>(userNotFoundReducer).call,
]);