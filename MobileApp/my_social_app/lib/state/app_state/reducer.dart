import 'package:my_social_app/state/app_state/access_token_state/reducers.dart';
import 'package:my_social_app/state/app_state/account_state/reducers.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/application_init_state/reducers.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/reducer.dart';
import 'package:my_social_app/state/app_state/create_comment_state/reducers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/exam_state/reducers.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/home_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/reducer.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/reducers.dart';
import 'package:my_social_app/state/app_state/policy_state/reducers.dart';
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
import 'package:my_social_app/state/app_state/upload_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_search_state/reducers.dart';
import 'package:my_social_app/state/app_state/video_questions_state/reducers.dart';
import 'package:redux/redux.dart';


AppState clearStateReducer(AppState prev,ClearStateAction action) => prev.clear();

AppState appReducer(AppState prev,AppAction action) => AppState(
  activeAccountPage: changeActiveAccountPageReducer(prev.activeAccountPage, action),
  accessToken: changeAccessTokenReducer(prev.accessToken,action),
  accountState: accoutStateReducers(prev.accountState,action),
  isInitialized: appSuccessfullyInitReducer(prev.isInitialized,action),
  userEntityState: userEntityStateReducers(prev.userEntityState, action),
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
  messageHomePageState: messageHomePageReducers(prev.messageHomePageState,action),
  userSearchEntityState: userSearchEntityReducers(prev.userSearchEntityState,action),
  followEntityState: followEntityReducers(prev.followEntityState,action),
  questionEntityState: questionsReducer(prev.questionEntityState,action),
  questionUserLikeEntityState: questionUserLikeEntityReducers(prev.questionUserLikeEntityState,action),
  questionUserSaveEntityState: questionUserSaveEntityReducers(prev.questionUserSaveEntityState,action),
  solutionUserVoteEntityState: solutionUserVoteEntityReducers(prev.solutionUserVoteEntityState,action),
  solutionUserSaveEntityState: solutionUserSaveEntityReducers(prev.solutionUserSaveEntityState,action),
  exams: examsReducers(prev.exams,action),
  policyState: policyReducers(prev.policyState,action),
  videoQuestions: videoQuestionsReducers(prev.videoQuestions, action),
  uploadEntityState: uploadingEntityStateReducers(prev.uploadEntityState, action)
);

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState,AppAction>(appReducer).call,
]);