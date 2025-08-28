import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/ai_model_state/middlewares.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';
import 'package:my_social_app/state/app_state/balance_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/comment_user_likes_state.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/comments_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exams_state/middleware.dart';
import 'package:my_social_app/state/app_state/follows_state/follows_state.dart';
import 'package:my_social_app/state/app_state/follows_state/middlewares.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/login_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/conversations_state/middlewares.dart';
import 'package:my_social_app/state/app_state/questions_state/middleware.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/middlewares.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/question_user_likes_state.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/app_state/search_users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_votes_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subjects_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subjects_state/subjects_state.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topics_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/app_state/topics_state/topics_state.dart';
import 'package:my_social_app/state/app_state/transaction_state/middlewares.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/follows_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:my_social_app/state/app_state/user_message_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/middlewares.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
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
    aiModels: Pagination.init(aiModelsPerPage, false),
    transactions: Pagination.init(transactionsPerPage, true),
    activeLoginPage: ActiveLoginPage.loginPage,
    examRequests: Pagination.init(examRequestsPerPage, true),
    subjectRequests: Pagination.init(subjectRequestsPerPage, true),
    topicRequests: Pagination.init(topicRequestsPerPage, true),

    stories: EntityState(),

    userEntityState: EntityState(),
    userMessageState: EntityState(),

    login: Login.loading(),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    conversations: Pagination.init(conversationsPerPage,true),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    uploadEntityState: UploadEntityState.init()
  ),
  middleware: [
     //users
    loadUserByIdMiddleware,
    loadUserByUserNameMiddleware,
    //users

    //follows
    followMiddleware,
    unfollowMiddleware,
    nextFollowersMiddleware,
    refreshFollowersMiddleware,
    nextFollowedsMiddleware,
    refreshFollowedsMiddleware,
    //follows

    //questions
    loadQuestionMiddleware,
    createQuestionMiddleware,
    deleteQuestionMiddleware,

    nexHomeQuestionsMiddleware,
    refreshHomeQuestionsMiddleware,

    nextSearchPageQuestionsMiddleware,
    refreshSearchPageQuestionsMiddleware,
   
    nextVideoQuestionsMiddleware,
    refreshVideoQuestionsMiddleware,

    nextUserQuestionsMiddleware,
    refreshUserQuestionsMiddleware,
    nextUserSolvedQuestionsMiddleware,
    refreshUserSolvedQuestionsMiddleware,
    nextUserUnsolvedQuestionsMiddleware,
    refreshUserUnsolvedQuestionsMiddleware,

    nextExamQuestionsMiddleware,
    refreshExamQuestionsMiddleware,
    nextSubjectQuestionsMiddleware,
    refreshSubjectQuestionsMiddleware,
    nextTopicQuestionsMiddleware,
    refreshTopicQuestionsMiddleware,
    //questions

    //question user likes
    nextQuestionUserLikesMiddleware,
    refreshQuestionUserLikesMiddleware,
    likeQuestionMiddleware,
    dislikeQuestionMiddleware,
    //question user likes

    //solutions
    createSolutionMiddleware,
    createSolutionByAiMiddleware,
    deleteSolutionMiddleware,
    markSolutionAsCorrectMiddleware,
    markSolutionAsIncorrectMiddleware,
    nextQuestionSolutionsMiddleware,
    refreshQuestionSolutionsMiddleware,
    nextQuestionCorrectSolutionsMiddleware,
    refreshQuestionCorrectSolutionsMiddleware,
    nextQuestionPendingSolutionsMiddleware,
    refreshQuestionPendingSolutionsMiddleware,
    nextQuestionIncorrectSolutionsMiddleware,
    refreshQuestionIncorrectSolutionsMiddleware,
    nextQuestionVideoSolutionsMiddleware,
    refreshQuestionVideoSolutionsMiddleware,
    //solutions

    //solution user votes
    makeSolutionUpvoteMiddleware,
    removeSolutionUpvoteMiddleware,
    nextSolutionUpvotesMiddleware,
    refreshSolutionUpvotesMiddleware,

    makeSolutionDownvoteMiddleware,
    removeSolutionDownvoteMiddleware,
    nextSolutionDownvotesMiddleware,
    refreshSolutionDownvotesMiddleware,
    //solution user votes


    //comments
    createCommentMiddleware,
    deleteCommentMiddleware,
    
    nextQuestionCommentsMiddleware,
    refreshQuestionCommentsMiddleware,
    
    nextSolutionCommentsMiddleware,
    refreshSolutionCommentsMiddleware,

    nextCommentCommentsMiddleware,
    refreshCommentCommentsMiddleware,
    //comments

    //comment user likes
    likeCommentMiddleware,
    dislikeCommentMiddleware,
    nextCommentLikesMiddleware,
    refreshCommentLikesMiddleware,
    //comment user likes

    //exams middlewares
    nextExamsMiddleware,
    refreshExamsMiddleware,
    //exams middlewares

    //subjects middlewares
    nextExamSubjectsMiddleware,
    refreshExamSubjectsMiddleware,
    //subjects middlewares

    //topics middlewares
    nextSubjectTopicsMiddleware,
    refreshSubjectTopicsMiddleware,
    //topics middlewares

    //user user block middlewares
    blockUserMiddleware,
    unblockUserMiddleware,
    nextUserUserBlockMiddleware,
    //user user block middlewares

    //search users middleware
    firstSearchUsersMiddleware,
    nextSearchUsersMiddleware,
    prevSearchUsersMiddleware,
    //search users middleware

    //user user conversations middlewares
    nextUserUserConversationsMiddleware,
    firstUserUserConversationsMiddleware,
    //user user conversations middlewares

    //user user searchs middlewares
    createUserUserSearchMiddleware,
    removeUserUserSearchMiddleware,
    nextUserUserSearchsMiddleware,
    //user user searchs middlewares

    //balance state
    loadBalanceMiddleware,
    //balance state


    //ai models state
    getAllAIModelsMiddleware,
    //ai models state

    //transactions state
    nextTransactionsMiddleware,
    firstTransactionsMiddleware,
    //transactions state
    
    
    //account start
    loginByRefreshTokenMiddleware,
    confirmEmailMiddleware,
    updateLanguageMiddleware,
    loginByPaswordMiddleware,
    loginByGoogleMiddleware,
    createUserMiddleware,
    deleteUserMiddleware,
    approvePrivacyPolicyMiddleware,
    approveTersmOfUseMiddleware,
    logOutMiddleware,
    //account end

    //story
    createStoryMiddleware,
    deleteStoryMiddleware,
    getStoriesMiddleware,
    viewStoryMiddleware,
    nextStoryUserViewsMiddleware,
    firstStoryUserViewsMiddleware,
    //story

    //message connection
    loadMessageConnectionMiddleware,
    //

    //message
    nextUserMessagesMiddleware,
    
    //Exam requests state
    createExamRequestMiddleware,
    deleteExamRequestMiddleware,
    nextExamRequestsMiddleware,
    firstExamRequestsMiddleware,
    //Exam requests state

    // Questions entity state

  
    //notifications start
    markNotificationsAsViewedMiddleware,
    getUnviewedNotificationMiddleware,
    getNextPageNotificationsMiddleware,

    //conversations
    nextConversationsMiddleware,

    //message
    createMessageWithMediasMiddleware,
    createMessageMiddleware,
    markMessagesAsReceivedMiddleware,
    markMessagesAsViewedMiddleware,
    getUnviewedMessagesMiddleware,
    loadMessageMiddleware,
    removeMessagesMiddleware,
    removeMessagesByUserIdsMiddleware,
 
    //policyState
    loadPrivacyPolicyMiddleware,
    loadTermsOfUseMiddleware,

    //subject requests
    createSubjectRequestMiddleware,
    deleteSubjectRequestMiddleware,
    nextSubjectRequestsMiddleware,
    firstSubjectRequestsMiddleware,

    //topic requests
    createTopicRequestMiddleware,
    deletTopicRequestMiddleware,
    nextTopicRequestsMiddleware,
    firstTopicRequestsMiddleware
  ]
);