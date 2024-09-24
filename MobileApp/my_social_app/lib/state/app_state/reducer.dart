import 'package:my_social_app/state/app_state/account_state/reducers.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/reducer.dart';
import 'package:my_social_app/state/app_state/create_comment_state/reducers.dart';
import 'package:my_social_app/state/app_state/create_message_state/reducers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/home_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/reducer.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/reducers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/reducer.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_search_state/reducers.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:redux/redux.dart';

ActiveLoginPage changeActiveLoginPageReducer(ActiveLoginPage oldState,Action action)
  => action is ChangeActiveLoginPageAction ? action.payload : oldState;

String? changeAccessTokenReducer(String? oldState,Action action)
  => action is ChangeAccessTokenAction ? action.accessToken : oldState;

bool appSuccessfullyInitReducer(bool oldState,Action action)
  => action is ApplicationSuccessfullyInitAction ? true : oldState;

//exams reducers//
Pagination getNextPageExamsReducer(Pagination prev,GetNextPageExamsAction action)
  => prev.startLoadingNext();
Pagination addNextPageExamsReducer(Pagination prev,AddNextPageExamsAction action)
  => prev.addNextPage(action.examIds);
Reducer<Pagination> examsReducers = combineReducers<Pagination>([
  TypedReducer<Pagination,GetNextPageExamsAction>(getNextPageExamsReducer).call,
  TypedReducer<Pagination,AddNextPageExamsAction>(addNextPageExamsReducer).call,
]);
//exams reducers//


AppState clearStateReducer(AppState prev,ClearStateAction action) => prev.clear();

AppState appReducer(AppState prev,AppAction action) => AppState(
  accessToken: changeAccessTokenReducer(prev.accessToken,action),
  accountState: updateAccountStateReducer(prev.accountState,action),
  activeLoginPage: changeActiveLoginPageReducer(prev.activeLoginPage,action),
  isInitialized: appSuccessfullyInitReducer(prev.isInitialized,action),
  userEntityState: userEntityStateReducers(prev.userEntityState, action),
  userImageEntityState: userImageEntityStateReducers(prev.userImageEntityState,action),
  searchState: searchStateReducers(prev.searchState,action),
  examEntityState: examEntityStateReducers(prev.examEntityState,action),
  subjectEntityState: subjectEntityStateReducers(prev.subjectEntityState, action),
  topicEntityState: topicEntityStateReducers(prev.topicEntityState, action),
  solutionEntityState: solutionEntityStateReducers(prev.solutionEntityState,action),
  homePageState: homePageReducers(prev.homePageState,action),
  commentEntityState: questionCommentEntityStateReducers(prev.commentEntityState,action),
  commentUserLikeEntityState: commentUserLikeEntityReducers(prev.commentUserLikeEntityState,action),
  createCommentState: createCommentStateReducers(prev.createCommentState,action),
  notificationEntityState: notificationEntityStateReducers(prev.notificationEntityState,action),
  messageEntityState: messageEntityStateReducers(prev.messageEntityState,action),
  messageImageEntityState: messageImageEntityReducers(prev.messageImageEntityState,action),
  messageHomePageState: messageHomePageReducers(prev.messageHomePageState,action),
  createMessageState: createMessageReducers(prev.createMessageState,action),
  userSearchEntityState: userSearchEntityReducers(prev.userSearchEntityState,action),
  followEntityState: followEntityReducers(prev.followEntityState,action),
  questionEntityState: questionsReducer(prev.questionEntityState,action),
  questionUserLikeEntityState: questionUserLikeEntityReducers(prev.questionUserLikeEntityState,action),
  questionUserSaveEntityState: questionUserSaveEntityReducers(prev.questionUserSaveEntityState,action),
  solutionUserVoteEntityState: solutionUserVoteEntityReducers(prev.solutionUserVoteEntityState,action),
  solutionUserSaveEntityState: solutionUserSaveEntityReducers(prev.solutionUserSaveEntityState,action),
  exams: examsReducers(prev.exams,action),
);

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState,AppAction>(appReducer).call,
]);