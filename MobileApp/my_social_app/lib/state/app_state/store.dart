import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/account_state/middlewares.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/middlewares.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_entity_state.dart';
import 'package:my_social_app/state/app_state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/app_state/home_page_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_entity_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/message_home_page_state.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/middlewares.dart';
import 'package:my_social_app/state/app_state/middlewares.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/app_state/policy_state/middlewares.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_entity_state.dart';
import 'package:my_social_app/state/app_state/reducer.dart';
import 'package:my_social_app/state/app_state/search_state/middlewares.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_entity_state.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_entity_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_entity_state.dart';
import 'package:my_social_app/state/app_state/video_questions_state/middlewares.dart';
import 'package:my_social_app/state/pagination/entity_pagination.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducers,
  initialState: AppState(
    activeAccountPage: ActiveAccountPage.loginPage,
    accessToken: null,
    accountState: null,
    isInitialized: false,
    userEntityState: const UserEntityState(entities: {}),
    searchState: SearchState(
      key: "",examId: null,subjectId: null,topicId: null,
      questions: Pagination.init(questionsPerPage,true),
      users: Pagination.init(usersPerPage,true),
      searchedUsers: Pagination.init(usersPerPage,true)
    ),
    examEntityState: const ExamEntityState(entities: {}),
    subjectEntityState: const SubjectEntityState(entities: {}),
    topicEntityState: const TopicEntityState(entities: {}),
    solutionEntityState: const SolutionEntityState(entities: {}),
    homePageState: HomePageState(questions: Pagination.init(questionsPerPage,true)),
    commentEntityState: const CommentEntityState(entities: {}),
    commentUserLikeEntityState: const CommentUserLikeEntityState(entities: {}),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, content: ""),
    notificationEntityState: NotificationEntityState(pagination: EntityPagination.init(notificationsPerPage, true)),
    messageEntityState: const MessageEntityState(entities: {}),
    messageHomePageState: MessageHomePageState(conversations: Pagination.init(conversationsPerPage,true)),
    userSearchEntityState: const UserSearchEntityState(entities: {}),
    followEntityState: const FollowEntityState(entities: {}),
    questionEntityState: const QuestionEntityState(entities: {}),
    questionUserLikeEntityState: const QuestionUserLikeEntityState(entities: {}),
    questionUserSaveEntityState: const QuestionUserSaveEntityState(entities: {}),
    solutionUserVoteEntityState: const SolutionUserVoteEntityState(entities: {}),
    solutionUserSaveEntityState: const SolutionUserSaveEntityState(entities: {}),
    exams: Pagination.init(examsPerPage, true),
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
    loginByFaceBookMiddleware,
    loginByGoogleMiddleware,
    createAccountMiddleware,
    deleteAccountMiddleware,
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

    getNextPageUserNotFollowedsIfNoPageMiddleware,
    getNextPageUserNotFollowedsIfReadyMiddleware,
    getNextPageUserNotFollowedsMiddleware,

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
    saveQuestionMiddleware,
    unsaveQuestionMiddleware,
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