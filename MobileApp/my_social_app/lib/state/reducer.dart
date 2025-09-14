import 'package:my_social_app/state/active_login_page_state/reducers.dart';
import 'package:my_social_app/state/ai_model_state/reducers.dart';
import 'package:my_social_app/state/balance_state/reducers.dart';
import 'package:my_social_app/state/comment_user_likes_state/reducers.dart';
import 'package:my_social_app/state/comments_state/reducers.dart';
import 'package:my_social_app/state/exam_requests_state/reducers.dart';
import 'package:my_social_app/state/exams_state/reducers.dart';
import 'package:my_social_app/state/follows_state/reducers.dart';
import 'package:my_social_app/state/login_state/reducers.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/message_connection_entity_state/reducers.dart';
import 'package:my_social_app/state/message_entity_state/reducer.dart';
import 'package:my_social_app/state/conversations_state/reducers.dart';
import 'package:my_social_app/state/questions_state/reducers.dart';
import 'package:my_social_app/state/notifications_state.dart/reducers.dart';
import 'package:my_social_app/state/policy_state/reducers.dart';
import 'package:my_social_app/state/question_user_likes_state/reducers.dart';
import 'package:my_social_app/state/search_page_state/reducers.dart';
import 'package:my_social_app/state/search_users_state/reducers.dart';
import 'package:my_social_app/state/solution_votes_state/reducers.dart';
import 'package:my_social_app/state/solutions_state/reducers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/story_state/reducers.dart';
import 'package:my_social_app/state/subject_request_state/reducers.dart';
import 'package:my_social_app/state/subjects_state/reducers.dart';
import 'package:my_social_app/state/topic_requests_state/reducers.dart';
import 'package:my_social_app/state/topics_state/reducers.dart';
import 'package:my_social_app/state/transaction_state/reducers.dart';
import 'package:my_social_app/state/user_message_state/reducers.dart';
import 'package:my_social_app/state/user_user_block_state/reducers.dart';
import 'package:my_social_app/state/user_user_conversation_state/reducers.dart';
import 'package:my_social_app/state/user_user_search_state/reducers.dart';
import 'package:my_social_app/state/users_state/reducers.dart';
import 'package:redux/redux.dart';

AppState clearStateReducer(AppState prev,ClearStateAction action) => prev.clear();

AppState appReducer(AppState prev,AppAction action) => AppState(
  users: usersReducer(prev.users, action),
  follows: followsReducer(prev.follows, action),

  questions: newQuestionsReducer(prev.questions, action),
  questionUserLikes: questionUserLikes(prev.questionUserLikes, action),
  
  solutions: solutionsReducer(prev.solutions, action),
  solutionVotes: solutionUserVotesReducers(prev.solutionVotes, action),

  comments: commentsReducer(prev.comments, action),
  commentUserLikes: commentUserLikesReducer(prev.commentUserLikes, action),
  
  searchPageState: searchPageReducers(prev.searchPageState, action),
  exams: examsReducer(prev.exams, action),
  subjects: subjectsReducer(prev.subjects, action),
  topics: topicsReducers(prev.topics, action),

  searchUsers: searchUsersReducers(prev.searchUsers,action),
  userUserSearchs: userUserSearchsReducers(prev.userUserSearchs,action),
  messageConnectionEntityState: messageConnectionsReducers(prev.messageConnectionEntityState,action),
  stories: storyReducers(prev.stories,action),
  userUserBlocks: userUserBlockReducers(prev.userUserBlocks, action),
  userUserConversations: userUserConversationReducers(prev.userUserConversations,action),
  balance: balanceReducers(prev.balance, action),
  aiModels: aiModelReducers(prev.aiModels, action),
  userMessageState: userMessageReducers(prev.userMessageState, action),
  transactions: transactionReducers(prev.transactions, action),
  login: loginReducers(prev.login,action),
  activeLoginPage: activeLoginPageReducers(prev.activeLoginPage, action),
  examRequests: examRequestReducers(prev.examRequests, action),
  subjectRequests: subjectRequestsReducers(prev.subjectRequests, action),
  topicRequests: topicRequestsReducers(prev.topicRequests, action),

  notifications: notificationEntityStateReducers(prev.notifications,action),
  messageEntityState: messageEntityStateReducers(prev.messageEntityState,action),
  conversations: conversationsReducer(prev.conversations,action),
  policyState: policyReducers(prev.policyState,action),
);

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState,AppAction>(appReducer).call,
]);