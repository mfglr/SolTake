import 'package:my_social_app/state/app_state/ai_model_state/reducers.dart';
import 'package:my_social_app/state/app_state/balance_state/reducers.dart';
import 'package:my_social_app/state/app_state/login_state/reducers.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/application_init_state/reducers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/app_exams_state/reducers.dart';
import 'package:my_social_app/state/app_state/home_page_questions_state/reducers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/reducer.dart';
import 'package:my_social_app/state/app_state/conversations_state/reducers.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/reducers.dart';
import 'package:my_social_app/state/app_state/policy_state/reducers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_questions_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_users_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/reducers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/reducers.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/transaction_state/reducers.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_message_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/reducers.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/reducers.dart';
import 'package:my_social_app/state/app_state/video_questions_state/reducers.dart';
import 'package:redux/redux.dart';

AppState clearStateReducer(AppState prev,ClearStateAction action) => prev.clear();

AppState appReducer(AppState prev,AppAction action) => AppState(
  searchUsers: searchUsersReducers(prev.searchUsers,action),
  searchQuestions: searchQuestionsReducer(prev.searchQuestions,action),
  userUserSearchs: userUserSearchsReducers(prev.userUserSearchs,action),
  questionUserSaves: questionUserSavesReducers(prev.questionUserSaves,action),
  solutionUserSaves: solutionUserSavesReducers(prev.solutionUserSaves,action),
  messageConnectionEntityState: messageConnectionsReducers(prev.messageConnectionEntityState,action),
  stories: storyReducers(prev.stories,action),
  userUserBlocks: userUserBlockReducers(prev.userUserBlocks, action),
  userUserConversations: userUserConversationReducers(prev.userUserConversations,action),
  balance: balanceReducers(prev.balance, action),
  aiModels: aiModelReducers(prev.aiModels, action),
  userEntityState: userEntityStateReducers(prev.userEntityState, action),
  userMessageState: userMessageReducers(prev.userMessageState, action),
  transactions: transactionReducers(prev.transactions, action),
  loginState: accoutStateReducers(prev.loginState,action),
  isLogin: loginSuccessReducer(prev.isLogin,action),
  examEntityState: examEntityStateReducers(prev.examEntityState,action),
  subjectEntityState: subjectEntityStateReducers(prev.subjectEntityState, action),
  topicEntityState: topicEntityStateReducers(prev.topicEntityState, action),
  solutionEntityState: solutionEntityStateReducers(prev.solutionEntityState,action),
  homePageQuestions: homePageQuestionsReducers(prev.homePageQuestions, action),
  commentEntityState: questionCommentEntityStateReducers(prev.commentEntityState,action),
  notifications: notificationEntityStateReducers(prev.notifications,action),
  messageEntityState: messageEntityStateReducers(prev.messageEntityState,action),
  conversations: conversationsReducer(prev.conversations,action),
  questionEntityState: questionsReducer(prev.questionEntityState,action),
  appExams: appExamsReducers(prev.appExams, action),
  policyState: policyReducers(prev.policyState,action),
  videoQuestions: videoQuestionsReducers(prev.videoQuestions, action),
  uploadEntityState: uploadingEntityStateReducers(prev.uploadEntityState, action)
);

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState,AppAction>(appReducer).call,
]);