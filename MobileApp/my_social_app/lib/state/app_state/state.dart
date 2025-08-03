import 'dart:core';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_status.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/new_questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subjects_state.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/app_state/topics_state/topics_state.dart';
import 'package:my_social_app/state/app_state/transaction_state/transaction_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:my_social_app/state/app_state/user_message_state/user_message_state.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/new_entity_collection.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class AppState{
  final NewQuestionsState newQuetions;
  
  final UsersState users;
  final QuestionsState questions;
  final SolutionsState solutions;
  final CommentsState comments;
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

  final EntityState<int,UserState> userEntityState;
  final EntityState<int,UserMessageState> userMessageState;

  final Pagination<int,NotificationState> notifications;
  final Login login;
  final EntityState<int,SolutionState> solutionEntityState;
  final EntityState<int,MessageState> messageEntityState;
  final Pagination<int,Id<int>> conversations;
  final PolicyState policyState;
  final UploadEntityState uploadEntityState;

  const AppState({
    required this.newQuetions,

    required this.users,
    required this.questions,
    required this.solutions,
    required this.comments,
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

    required this.userEntityState,
    required this.userMessageState,

    required this.conversations,
    required this.login,
    required this.solutionEntityState,
    required this.notifications,
    required this.messageEntityState,
    required this.policyState,
    required this.uploadEntityState
  });

  AppState clear() => AppState(
    newQuetions: NewQuestionsState(
      questions: NewEntityCollection(),
      homeQuestions: KeyPagination.init(questionsPerPage, true),
      searchQuestions: KeyPagination.init(questionsPerPage, true),
      videoQuestions: KeyPagination.init(questionsPerPage, true),
      userQuestions: const <int, KeyPagination<int>>{},
      userSolvedQuestions: const <int, KeyPagination<int>>{},
      userUnsolvedQuestions: const <int, KeyPagination<int>>{},
    ),

    users: UsersState(
      usersById: EntityCollection<int, UserState>(),
      usersByUserName: EntityCollection<String, UserState>(),
      followeds: const <int, Pagination<int, FollowState>>{},
      followers: const <int, Pagination<int, FollowState>>{}
    ),

    questions: QuestionsState(
      questions: EntityCollection(),
      userSolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      userUnsolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      examQuestions: const <int, Pagination<int, QuestionState>>{},
      subjectQuestions: const <int, Pagination<int, QuestionState>>{},
      topicQuestions: const <int, Pagination<int, QuestionState>>{},
      searchPageQuestions: Pagination.init(questionsPerPage, true),
      videoQuestions: Pagination.init(questionsPerPage, true),
      questionUserSaves: Pagination.init(questionsPerPage, true),
      questionUserLikes: const <int, Pagination<int, QuestionUserLikeState>>{},
    ),

    solutions: const SolutionsState(
      questionSolutions: <int, Pagination<int, SolutionState>>{},
      questionCorrectSolutions: <int, Pagination<int, SolutionState>>{},
      questionPendingSolutions: <int, Pagination<int, SolutionState>>{},
      questionIncorrectSolutions: <int, Pagination<int, SolutionState>>{},
      questionVideoSolutions: <int, Pagination<int, SolutionState>>{},
    ),

    comments: const CommentsState(
      questionComments: <int, Pagination<int, CommentState>>{},
      solutionComments: <int, Pagination<int, CommentState>>{},
      children: <int, Pagination<int, CommentState>>{},
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
    
    userEntityState: EntityState(),
    userMessageState: EntityState(),

    conversations: Pagination.init(conversationsPerPage,true),
    login: Login.init(),
    
    solutionEntityState: EntityState(),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    uploadEntityState: UploadEntityState.init()
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