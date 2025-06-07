import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/reducers.dart';
import 'package:soltake_broker/state/app_state/question_state/reducers.dart';

AppState clearStateReducer(AppState prev, ClearStateAction action) =>
  prev.clear();

AppState appReducer(AppState prev, AppAction action) => 
  AppState(
    login: loginReducers(prev.login, action),
    questions: questionReducers(prev.questions, action)
  );

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState, ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState, AppAction>(appReducer).call
]);