import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/login_state/middlewares.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/home_page_questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/conversations_state/middlewares.dart';
import 'package:my_social_app/state/app_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/middlewares.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/search_users_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/middlewares.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_message_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/middlewares.dart';
import 'package:my_social_app/state/app_state/video_questions_state/middlewares.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
    searchUsers: Pagination.init(usersPerPage, true),
    searchQuestions: Pagination.init(questionsPerPage, true),
    userUserSearchs: Pagination.init(usersPerPage, true),
    questionUserSaves: Pagination.init(questionsPerPage, true),
    solutionUserSaves: Pagination.init(solutionsPerPage, true),
    messageConnectionEntityState: EntityState(),

    stories: EntityState(),

    userEntityState: EntityState(),
    userMessageState: EntityState(),

    questionEntityState: EntityState(),
    homePageQuestions: Pagination.init(questionsPerPage, true),
    examEntityState: EntityState(),
    appExams: Pagination.init(examsPerPage, true),
    activeAccountPage: ActiveAccountPage.loginPage,
    loginState: null,
    isInitialized: false,
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    conversations: Pagination.init(conversationsPerPage,true),
    userSearchEntityState: EntityState(),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    videoQuestions: Pagination.init(questionsPerPage, true),
    uploadEntityState: UploadEntityState.init()
  ),
  middleware: [
    
    //question user save middlewares
    createQuestionUserSaveMiddleware,
    deleteQuestionUserSaveMiddleware,
    nextQuestionUserSavesMiddleware,
    //questino user save middlewares

    //search users middleware
    firstSearchUsersMiddleware,
    nextSearchUsersMiddleware,
    prevSearchUsersMiddleware,
    //search users middleware

    //search questions middleware
    firstSearchQuestionsMiddleware,
    nextSearchQuestionsMiddleware,
    //search questions middleware

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


    //exams middlewares
    nextExamsMidleware,

    //Comment entity state middleware
    getNextPageCommentLikesMiddleware,
    likeCommentMiddleware,
    dislikeCommentMiddleware,
    
    nextCommentChildrenMiddleware,

    //Home page state
    nextHomeQuestionsMiddleware,
    prevHomeQuestionsMiddleware,
    
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
    getStoriesMiddleware,
    viewStoryMiddleware,
    deleteStoryMiddleware,
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
    nextUserQuestionsMiddleware,
    nextUserSolvedQuestionsMiddleware,
    nextUserUnsolvedQuestionsMiddleware,
    nextUserConvesationsMiddleware,

    updateUserNameMiddleware,
    updateNameMiddleware,
    updateBiographyMidleware,
    uploadUserImageMiddleware,
    removeUserImageMiddleware,
    
    
    //Exam entity state
    loadExamMiddleare,
    nextExamSubjectsMiddleware,
    nextExamQeuestionsMiddleware,
    prevExamQuestionsMiddleware,

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
    likeQuestionMiddleware,
    dislikeQuestionMiddleware,

    nextQuestionLikesMiddleware,
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
  ]
);