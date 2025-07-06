import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/ai_model_state/middlewares.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';
import 'package:my_social_app/state/app_state/balance_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/middlewares.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/login_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/conversations_state/middlewares.dart';
import 'package:my_social_app/state/app_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/middlewares.dart';
import 'package:my_social_app/state/app_state/questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/search_users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/middlewares.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subject_request_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/middlewares.dart';
import 'package:my_social_app/state/app_state/transaction_state/middlewares.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_message_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/middlewares.dart';
import 'package:my_social_app/state/app_state/video_questions_state/middlewares.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
    questions: QuestionsState(
      userQuestions: const <int, Pagination<int, QuestionState>>{},
      userSolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      userUnsolvedQuestions: const <int, Pagination<int, QuestionState>>{},
      examQuestions: const <int, Pagination<int, QuestionState>>{},
      subjectQuestions: const <int, Pagination<int, QuestionState>>{},
      topicQuestions: const <int, Pagination<int, QuestionState>>{},
      homePageQuestions: Pagination.init(questionsPerPage, true),
      searchPageQuestions: Pagination.init(questionsPerPage, true),
      savedQuestions: Pagination.init(questionsPerPage, true),
      questionUserLikes: const <int, Pagination<int, QuestionUserLikeState>>{},

    ),
    searchUsers: Pagination.init(usersPerPage, true),
    searchQuestions: Pagination.init(questionsPerPage, true),
    userUserSearchs: Pagination.init(usersPerPage, true),
    questionUserSaves: Pagination.init(questionsPerPage, true),
    solutionUserSaves: Pagination.init(solutionsPerPage, true),
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
    examEntityState: EntityState(),
    appExams: Pagination.init(examsPerPage, true),
    login: Login.loading(),
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    conversations: Pagination.init(conversationsPerPage,true),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    videoQuestions: Pagination.init(questionsPerPage, true),
    uploadEntityState: UploadEntityState.init()
  ),
  middleware: [
    //questions
    likeQuestionMiddleware,
    dislikeQuestionMiddleware,
    
    nextQuestionUserLikesMiddleware,
    refreshQuestionUserLikesMiddleware,

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
    //questions

    //question user save middlewares
    createQuestionUserSaveMiddleware,
    deleteQuestionUserSaveMiddleware,
    nextQuestionUserSavesMiddleware,
    //questino user save middlewares

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

    //search questions middleware
    firstSearchQuestionsMiddleware,
    nextSearchQuestionsMiddleware,
    //search questions middleware

    //user user conversations middlewares
    nextUserUserConversationsMiddleware,
    firstUserUserConversationsMiddleware,
    //user user conversations middlewares

    //user user searchs middlewares
    createUserUserSearchMiddleware,
    removeUserUserSearchMiddleware,
    nextUserUserSearchsMiddleware,
    //user user searchs middlewares

    //solution user saves middewares
    createSolutionUserSaveMiddleware,
    deleteSolutionUserSaveMiddleware,
    nextSolutionUserSavesMiddleware,
    //solution user saves middewares

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

    //exams middlewares
    nextExamsMidleware,

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

    //user entity state
    loadUserMiddleware,
    loadUserByUserNameMiddleware,

    followMiddleware,
    unfollowMiddleware,
    removeFollowerMiddleware,

    nextUserFollowersMiddleware,
    nextUserFollowedsMiddleware,

    updateUserNameMiddleware,
    updateNameMiddleware,
    updateBiographyMidleware,
    uploadUserImageMiddleware,
    removeUserImageMiddleware,
    
    //Exam requests state
    createExamRequestMiddleware,
    deleteExamRequestMiddleware,
    nextExamRequestsMiddleware,
    firstExamRequestsMiddleware,
    //Exam requests state

    //Exam entity state
    loadExamMiddleare,
    nextExamSubjectsMiddleware,

    //subject entity state
    loadSubjectMiddleware,
    nextSubjectQuestionsMiddleware,
    prevSubjectQuestionsMiddleware,
    nextSubjectTopicsMiddleware,

    //Topic start
    nextTopicQuestionsMiddleware,
    prevTopicQuestionsMiddleware,
    //Topic end

    // Questions entity state
    loadQuestionMiddleware,
    createQuestionMiddleware,
    deleteQuestionMiddleware,
    // saveQuestionMiddleware,
    // unsaveQuestionMiddleware,

    nextQuestionSolutionsMiddleware,
    nextQuestionCorrectSolutionsMiddleware,
    nextQuestionPendingSolutionsMiddleware,
    nextQuestionIncorrectSolutionsMiddleware,
    nextQuestionVideoSolutionsMiddleware,
    nextQuestionCommentsMiddleware,
    prevQuestionCommentsMiddleware,

    //solution entity state
    createSolutionMiddleware,
    createSolutionByAiMiddleware,
    loadSolutionMiddleware,
    removeSolutionMiddleware,
    nextSolutionCommentsMiddleware,

    makeSolutionUpvoteMiddleware,
    removeSolutionUpvoteMiddleware,
    markSolutionAsCorrectMiddleware,
    markSolutionAsIncorrectMiddleware,
    makeSolutionDownvoteMiddleware,
    removeSolutionDownvoteMiddleware,
    nextSolutionUpvotesMiddleware,
    nextSolutionDownvotesMiddleware,

    //comments entity state
    createCommentMiddleware,
    loadCommentMiddleware,
    loadCommentsMiddleware,
    removeCommentMiddleware,

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

    //video questions
    nextVideoQuestionsMiddleware,

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