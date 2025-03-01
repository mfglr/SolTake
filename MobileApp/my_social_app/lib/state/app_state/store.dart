import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/login_state/middlewares.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/home_page_questions_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/conversations_state/middlewares.dart';
import 'package:my_social_app/state/app_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_state/middlewares.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/video_questions_state/middlewares.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
    questionEntityState: EntityState(),
    homePageQuestions: Pagination.init(questionsPerPage, true),
    examEntityState: EntityState(),
    appExams: Pagination.init(examsPerPage, true),

    activeAccountPage: ActiveAccountPage.loginPage,
    accessToken: null,
    loginState: null,
    isInitialized: false,
    userEntityState: EntityState(),
    searchState: SearchState(
      key: "",examId: null,subjectId: null,topicId: null,
      questions: Pagination.init(questionsPerPage,true),
      users: Pagination.init(usersPerPage,true),
      searchedUsers: Pagination.init(usersPerPage,true)
    ),
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
    commentUserLikeEntityState: EntityState(),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, content: ""),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    conversations: Pagination.init(conversationsPerPage,true),
    userSearchEntityState: EntityState(),
    solutionUserVoteEntityState: EntityState(),
    solutionUserSaveEntityState: EntityState(),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    videoQuestions: Pagination.init(questionsPerPage, true),
    uploadEntityState: UploadEntityState.init()
  ),
  middleware: [
    //exams middlewares
    nextExamsMidleware,

    //Comment entity state middleware
    getNextPageCommentLikesMiddleware,
    likeCommentMiddleware,
    dislikeCommentMiddleware,
    
    nextCommentRepliesMiddleware,

    //Home page state
    getNextPageHomeQuestionsMiddleware,
    getPrevPageHomeQuestionsMiddleware,
    
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

    //user entity state
    loadUserMiddleware,
    loadUserByUserNameMiddleware,

    followMiddleware,
    unfollowMiddleware,
    removeFollowerMiddleware,

    nextUserFollowersMiddleware,
    nextUserFollowedsMiddleware,
    nextUserMessagesMiddleware,
    nextUserQuestionsMiddleware,
    nextUserSolvedQuestionsMiddleware,
    nextUserUnsolvedQuestionsMiddleware,
    nextUserSavedQuestionsMiddleware,
    nextUserSavedSolutionsMiddleware,
    nextUserConvesationsMiddleware,

    updateUserNameMiddleware,
    updateNameMiddleware,
    updateBiographyMidleware,
    uploadUserImageMiddleware,
    removeUserImageMiddleware,

    //search state
    firstSearchingUsersMiddleware,
    nextSearchingUsersMiddleware,
    nextSearchedUsersMiddleware,
    addSearchedUserMiddleware,
    removeSearchedUserMiddleware,
    
    firstSearchingQuestionsMiddleware,
    nextSearchingQuestionsMiddleware,
    //search end
    
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

    //solution entity state
    createSolutionMiddleware,
    createSolutionByAiMiddleware,
    loadSolutionMiddleware,
    removeSolutionMiddleware,
    makeSolutionUpvoteMiddleware,
    removeSolutionUpvoteMiddleware,
    markSolutionAsCorrectMiddleware,
    markSolutionAsIncorrectMiddleware,
    saveSolutionMiddleware,
    unsaveSolutionMiddleware,
    makeSolutionDownvoteMiddleware,
    removeSolutionDownvoteMiddleware,
    nextSolutionUpvotesMiddleware,
    nextSolutionDownvotesMiddleware,
    nextSolutionCommentsMiddleware,

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
    markComingMessageAsReceivedMiddleware,
    markComingMessageAsViewedMiddleware,
    markComingMessagesAsReceivedMiddleware,
    markComingMessagesAsViewedMiddleware,
    getUnviewedMessagesMiddleware,
    loadMessageMiddleware,
    removeMessageMiddleware,
    removeMessagesMiddleware,
    removeMessagesByUserIdsMiddleware,
 
    //policyState
    loadPrivacyPolicyMiddleware,
    loadTermsOfUseMiddleware,

    //video questions
    nextVideoQuestionsMiddleware,
  ]
);