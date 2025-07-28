import 'package:my_social_app/state/app_state/active_login_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/ai_model_state/reducers.dart';
import 'package:my_social_app/state/app_state/balance_state/reducers.dart';
import 'package:my_social_app/state/app_state/comments_state/reducers.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/reducers.dart';
import 'package:my_social_app/state/app_state/exams_state/reducers.dart';
import 'package:my_social_app/state/app_state/login_state/reducers.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/message_entity_state/reducer.dart';
import 'package:my_social_app/state/app_state/conversations_state/reducers.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/reducers.dart';
import 'package:my_social_app/state/app_state/policy_state/reducers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/questions_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_page_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_questions_state/reducers.dart';
import 'package:my_social_app/state/app_state/search_users_state/reducers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/solutions_state/reducers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/reducers.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/subject_request_state/reducers.dart';
import 'package:my_social_app/state/app_state/subjects_state/reducers.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/reducers.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/reducers.dart';
import 'package:my_social_app/state/app_state/topics_state/reducers.dart';
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
  questions: questionsReducers(prev.questions, action),
  solutions: solutionsReducer(prev.solutions, action),
  comments: commentsReducer(prev.comments, action),
  searchPageState: searchPageReducers(prev.searchPageState, action),
  exams: examsReducer(prev.exams, action),
  subjects: subjectsReducer(prev.subjects, action),
  topics: topicsReducers(prev.topics, action),

  searchUsers: searchUsersReducers(prev.searchUsers,action),
  searchQuestions: searchQuestionsReducer(prev.searchQuestions,action),
  userUserSearchs: userUserSearchsReducers(prev.userUserSearchs,action),
  messageConnectionEntityState: messageConnectionsReducers(prev.messageConnectionEntityState,action),
  stories: storyReducers(prev.stories,action),
  userUserBlocks: userUserBlockReducers(prev.userUserBlocks, action),
  userUserConversations: userUserConversationReducers(prev.userUserConversations,action),
  balance: balanceReducers(prev.balance, action),
  aiModels: aiModelReducers(prev.aiModels, action),
  userEntityState: userEntityStateReducers(prev.userEntityState, action),
  userMessageState: userMessageReducers(prev.userMessageState, action),
  transactions: transactionReducers(prev.transactions, action),
  login: loginReducers(prev.login,action),
  activeLoginPage: activeLoginPageReducers(prev.activeLoginPage, action),
  examRequests: examRequestReducers(prev.examRequests, action),
  subjectRequests: subjectRequestsReducers(prev.subjectRequests, action),
  topicRequests: topicRequestsReducers(prev.topicRequests, action),

  examEntityState: examEntityStateReducers(prev.examEntityState,action),
  subjectEntityState: subjectEntityStateReducers(prev.subjectEntityState, action),
  topicEntityState: topicEntityStateReducers(prev.topicEntityState, action),
  solutionEntityState: solutionEntityStateReducers(prev.solutionEntityState,action),
  commentEntityState: questionCommentEntityStateReducers(prev.commentEntityState,action),
  notifications: notificationEntityStateReducers(prev.notifications,action),
  messageEntityState: messageEntityStateReducers(prev.messageEntityState,action),
  conversations: conversationsReducer(prev.conversations,action),
  questionEntityState: questionsReducer(prev.questionEntityState,action),
  policyState: policyReducers(prev.policyState,action),
  videoQuestions: videoQuestionsReducers(prev.videoQuestions, action),
  uploadEntityState: uploadingEntityStateReducers(prev.uploadEntityState, action)
);

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState,AppAction>(appReducer).call,
]);