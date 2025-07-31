import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/ai_model_state/middlewares.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';
import 'package:my_social_app/state/app_state/balance_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/comments_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exams_state/middleware.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/login_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/conversations_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/app_state/search_users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/middlewares.dart';
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
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:my_social_app/state/app_state/user_message_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/middlewares.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_collection.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
    users: UsersState(
      usersById: EntityCollection<int, UserState>(),
      usersByUserName: EntityCollection<String, UserState>(),
      followeds: const <int, Pagination<int, FollowState>>{},
      followers: const <int, Pagination<int, FollowState>>{}
    ),
    
    questions: QuestionsState(
      userQuestions: const <int, Pagination<int, QuestionState>>{},
      userSolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      userUnsolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      examQuestions: const <int, Pagination<int, QuestionState>>{},
      subjectQuestions: const <int, Pagination<int, QuestionState>>{},
      topicQuestions: const <int, Pagination<int, QuestionState>>{},
      homePageQuestions: Pagination.init(questionsPerPage, true),
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
      children: <int, Pagination<int, CommentState>>{}
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

    questionEntityState: EntityState(),
    login: Login.loading(),
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
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
    followMiddleware,
    unfollowMiddleware,
    nextFollowersMiddleware,
    refreshFollowersMiddleware,
    nextFollowedsMiddleware,
    refreshFollowedsMiddleware,
    //users

    //questions
    createQuestionMiddleware,
    deleteQuestionMiddleware,

    changeExamMiddleware,
    changeSubjectMiddleware,
    changeTopicMiddleware,

    likeQuestionMiddleware,
    dislikeQuestionMiddleware,
    nextQuestionUserLikesMiddleware,
    refreshQuestionUserLikesMiddleware,

    nextQuestionUserSavesMiddleware,
    refreshQuestionUserSavesMiddleware,
    saveQuestionMiddleware,
    unsaveQuestionMiddleware,

    nextHomePageQuestionsMiddleware,
    refreshHomePageQuestionsMiddleware,
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
    nextVideoQuestionsMiddleware,
    refreshVideoQuestionsMiddleware,
    //questions

    //solutions
    createSolutionMiddleware,
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
    saveSolutionMiddeleware,
    unsaveSolutionMiddeleware,
    //solutions

    //comments
    createCommentMiddleware,
    nextQuestionCommentsMiddleware,
    refreshQuestionCommentsMiddleware,
    nextSolutionCommentsMiddleware,
    refreshSolutionCommentsMiddleware,
    //comments

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

    //Comment entity state middleware
    getNextPageCommentLikesMiddleware,
    likeCommentMiddleware,
    dislikeCommentMiddleware,
    
    nextCommentChildrenMiddleware,

    
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

    //subject entity state
    loadSubjectMiddleware,
    nextSubjectTopicsMiddleware,

    // Questions entity state
    loadQuestionMiddleware,
    // saveQuestionMiddleware,
    
    // unsaveQuestionMiddleware,

    //solution entity state
    createSolutionByAiMiddleware,
    loadSolutionMiddleware,

    makeSolutionUpvoteMiddleware,
    removeSolutionUpvoteMiddleware,
    makeSolutionDownvoteMiddleware,
    removeSolutionDownvoteMiddleware,
    nextSolutionUpvotesMiddleware,
    nextSolutionDownvotesMiddleware,

    //comments entity state
    loadCommentMiddleware,
    loadCommentsMiddleware,

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