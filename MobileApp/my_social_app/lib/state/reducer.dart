import 'package:my_social_app/state/account_state/reducers.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/create_question_state/reducers.dart';
import 'package:my_social_app/state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/search_state/reducers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/reducers.dart';
import 'package:my_social_app/state/topic_entity_state/reducers.dart';
import 'package:my_social_app/state/user_entity_state/reducers.dart';

ActiveLoginPage changeActiveLoginPageReducer(ActiveLoginPage oldState,Action action)
  => action is ChangeActiveLoginPageAction ? action.payload : oldState;

bool appSuccessfullyInitReducer(bool oldState,Action action)
  => action is ApplicationSuccessfullyInitAction ? true : oldState;

AppState appReducer(AppState oldState,action) => AppState(
  accountState: updateAccountStateReducer(oldState.accountState,action),
  activeLoginPage: changeActiveLoginPageReducer(oldState.activeLoginPage,action),
  isInitialized: appSuccessfullyInitReducer(oldState.isInitialized,action),
  userEntityState: userEntityStateReducers(oldState.userEntityState, action),
  searchState: searchStateReducers(oldState.searchState,action),
  createQuestionState: createQuestionReducers(oldState.createQuestionState,action),
  examEntityState: loadExamsReducer(oldState.examEntityState,action),
  subjectEntityState: loadSubjectsReducer(oldState.subjectEntityState, action),
  topicEntityState: loadTopicsReducer(oldState.topicEntityState, action)
);

