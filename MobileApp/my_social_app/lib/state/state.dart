import 'dart:core';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/balance_state/balance_state.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_likes_state.dart';
import 'package:my_social_app/state/comments_state/comments_state.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/follows_state/follows_state.dart';
import 'package:my_social_app/state/login_state/login.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/message_entity_state/message_status.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/questions_state/questions_state.dart';
import 'package:my_social_app/state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/state/policy_state/policy_state.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_likes_state.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/solution_votes_state/solution_votes_state.dart';
import 'package:my_social_app/state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/state/subjects_state/subjects_state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/topics_state/topics_state.dart';
import 'package:my_social_app/state/transaction_state/transaction_state.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/state/users_state/users_state.dart';
import 'package:my_social_app/state/user_message_state/user_message_state.dart';
import 'package:my_social_app/state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection.dart';
import 'package:my_social_app/custom_packages/entity_state/id.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection/entity_state.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';

@immutable
class AppState{
  final UsersState users;
  final FollowsState follows;

  final QuestionsState questions;
  final QuestionUserLikesState questionUserLikes;
  
  final SolutionsState solutions;
  final SolutionVotesState solutionVotes;

  final CommentsState comments;
  final CommentUserLikesState commentUserLikes;

  final SearchPageState searchPageState;
  final Pagination<int,ExamState> exams;
  final SubjectsState subjects;
  final TopicsState topics;


  final Pagination<int,SearchUserState> searchUsers;
  final Pagination<int,UserUserSearchState> userUserSearchs;
  final EntityState<int,MessageConnectionState> messageConnectionEntityState;
  final Pagination<int,UserUserBlockState> userUserBlocks;
  final Pagination<int,UserUserConversationState> userUserConversations;
  final BalanceState balance;
  final EntityState<int,StoryState> stories;
  final Pagination<int,AIModelState> aiModels;
  final Pagination<int,TransactionState> transactions;
  final ActiveLoginPage activeLoginPage;
  final Pagination<int,ExamRequestState> examRequests;
  final Pagination<int,SubjectRequestState> subjectRequests;
  final Pagination<int,TopicRequestState> topicRequests;

  final EntityState<int,UserMessageState> userMessageState;

  final Pagination<int,NotificationState> notifications;
  final Login login;
  final EntityState<int,MessageState> messageEntityState;
  final Pagination<int,Id<int>> conversations;
  final PolicyState policyState;

  const AppState({
    required this.users,
    required this.follows,

    required this.questions,
    required this.questionUserLikes,

    required this.solutions,
    required this.solutionVotes,

    required this.comments,
    required this.commentUserLikes,

    required this.searchPageState,
    required this.exams,
    required this.subjects,
    required this.topics,

    
    required this.searchUsers,
    required this.userUserSearchs,
    required this.messageConnectionEntityState,
    required this.userUserBlocks,
    required this.userUserConversations,
    required this.balance,
    required this.aiModels,
    required this.transactions,
    required this.activeLoginPage,
    required this.examRequests,
    required this.subjectRequests,
    required this.stories,
    required this.topicRequests,

    required this.userMessageState,

    required this.conversations,
    required this.login,
    required this.notifications,
    required this.messageEntityState,
    required this.policyState,
  });

  AppState clear() => AppState(
    users: UsersState(
      usersById: EntityCollection<int, UserState>(),
      usersByUserName: EntityCollection<String, UserState>(),
    ),
    follows: const FollowsState(
      followeds: <int, Pagination<int, FollowState>>{},
      followers: <int, Pagination<int, FollowState>>{}
    ),

    questions: QuestionsState(
      questions: EntityCollection(),
      homeQuestions: KeyPagination.init(questionsPerPage, true),
      searchQuestions: KeyPagination.init(questionsPerPage, true),
      videoQuestions: KeyPagination.init(questionsPerPage, true),

      userQuestions: const <int, KeyPagination<int>>{},
      userSolvedQuestions: const <int, KeyPagination<int>>{},
      userUnsolvedQuestions: const <int, KeyPagination<int>>{},

      examQuestions: const <int, KeyPagination<int>>{},
      subjectQuestions: const <int, KeyPagination<int>>{},
      topicQuestions: const <int, KeyPagination<int>>{},
    ),
    questionUserLikes: const QuestionUserLikesState(
      likes: <int, Pagination<int, QuestionUserLikeState>>{}
    ),

    solutions: SolutionsState(
      solutions: EntityCollection(),
      questionSolutions: const <int, KeyPagination<int>>{},
      questionCorrectSolutions: const  <int, KeyPagination<int>>{},
      questionPendingSolutions: const <int, KeyPagination<int>>{},
      questionIncorrectSolutions: const <int, KeyPagination<int>>{},
      questionVideoSolutions: const <int, KeyPagination<int>>{},
    ),
    solutionVotes: const SolutionVotesState(
      upvotes: <int, Pagination<int, SolutionUserVoteState>>{},
      downvotes: <int, Pagination<int, SolutionUserVoteState>>{}
    ),

    comments: CommentsState(
      comments: EntityCollection<int, CommentState>(),
      questionComments: const <int, KeyPagination<int>>{},
      solutionComments: const <int, KeyPagination<int>>{},
      commentComments: const <int, KeyPagination<int>>{},
    ),
   
    commentUserLikes: const CommentUserLikesState(
      commentUserLikes: <int, Pagination<int,CommentUserLikeState>>{}
    ),

    searchPageState: const SearchPageState(
      exam: null,
      subject: null,
      topic: null
    ),

    exams: Pagination.init(examsPerPage, true),
    subjects: const SubjectsState(examSubjects: <int,Pagination<int,SubjectState>>{}),
    topics: const TopicsState(subjectTopics: <int, Pagination<int, TopicState>>{}),

    searchUsers: Pagination.init(usersPerPage, true),
    userUserSearchs: Pagination.init(usersPerPage, true),
    messageConnectionEntityState: EntityState(),
    userUserBlocks: Pagination.init(usersPerPage, true),
    userUserConversations: Pagination.init(usersPerPage, true),
    balance: const BalanceState(balance: 0),
    stories: EntityState(),
    aiModels: Pagination.init(aiModelsPerPage, false),
    transactions: Pagination.init(transactionsPerPage, true),
    activeLoginPage: ActiveLoginPage.loginPage,
    examRequests: Pagination.init(examRequestsPerPage, true),
    subjectRequests: Pagination.init(subjectRequestsPerPage, true),
    topicRequests: Pagination.init(topicRequestsPerPage, true),
    
    userMessageState: EntityState(),

    conversations: Pagination.init(conversationsPerPage,true),
    login: Login.init(),
    
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
  );


  //select messages
  Iterable<MessageState> get selectConversations => 
    groupBy(messageEntityState.values, (x) => x.conversationId)
    .values
    .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last)
    .sorted((x,y) => y.id.compareTo(x.id));

  Iterable<MessageState> selectUserMessages(int userId)
    => userMessageState
        .getValue(userId)!.messageIds.values
        .map((e) => messageEntityState.getValue(e.id)!);

  Iterable<int> selectIdsOfUserUnviewedMessages(int userId)
    => messageEntityState
        .getList((e) => e.senderId == userId && e.state != MessageStatus.viewed)
        .map((e) => e.id);
        

  Iterable<int> get selectIdsOfNewComingMessages
    => messageEntityState.values
        .where((e) => e.state == MessageStatus.created && e.senderId != login.login!.id)
        .map((e) => e.id);
  int get selectNumberOfComingMessages
    => messageEntityState.values
        .where((e) => e.state != MessageStatus.viewed && e.senderId != login.login!.id)
        .length;

  //select users
  UserState? get currentUser => users.usersById[login.login!.id].entity;

  //select privacy policy
  String? get selectPrivacyPolicy => policyState.privacyPolicies[login.login?.language];
  //select terms of use
  String? get selectTermsOfUse => policyState.termOfUses[login.login?.language];
}