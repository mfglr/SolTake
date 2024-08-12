import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/account_state/middlewares.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/create_comment_state/middlewares.dart';
import 'package:my_social_app/state/create_message_state/create_message_state.dart';
import 'package:my_social_app/state/create_message_state/middlewares.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/create_question_state/middleware.dart';
import 'package:my_social_app/state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/create_solution_state/middlewares.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/home_page_state/middlewares.dart';
import 'package:my_social_app/state/message_entity_state/message_entity_state.dart';
import 'package:my_social_app/state/message_entity_state/middlewares.dart';
import 'package:my_social_app/state/message_home_page_state/message_home_page_state.dart';
import 'package:my_social_app/state/message_home_page_state/middlewares.dart';
import 'package:my_social_app/state/middlewares.dart';
import 'package:my_social_app/state/comment_entity_state/middlewares.dart';
import 'package:my_social_app/state/comment_entity_state/comment_entity_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/middlewares.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/question_image_entity_state/middlewares.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_entity_state.dart';
import 'package:my_social_app/state/reducer.dart';
import 'package:my_social_app/state/search_state/middlewares.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/solution_entity_state/middlewares.dart';
import 'package:my_social_app/state/solution_entity_state/solution_entity_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/middlewares.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_entity_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/user_image_entity_state/middlewares.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_entity_state.dart';
import 'package:redux/redux.dart';

final store = Store(
  appReducer,
  initialState: AppState(
    accessToken: null,
    accountState: null,
    activeLoginPage: ActiveLoginPage.loginPage,
    isInitialized: false,
    userEntityState: const UserEntityState(entities: {}),
    userImageEntityState: const UserImageEntityState(entities: {}),
    searchState: SearchState(key: "", users: Pagination.init(usersPerPage)),
    createQuestionState: const CreateQuestionState(images: [],examId: null, subjectId: null, topicIds: [], content: null),
    createSolutionState: const CreateSolutionState(questionId: null, content: "", images: []),
    examEntityState: const ExamEntityState(entities: {}, isLast: false,isLoading: false),
    subjectEntityState: const SubjectEntityState(entities: {}),
    topicEntityState: const TopicEntityState(entities: {}),
    questionEntityState: const QuestionEntityState(entities: {}),
    questionImageEntityState: const QuestionImageEntityState(entities: {}),
    solutionEntityState: const SolutionEntityState(entities: {}),
    solutionImageEntityState: const SolutionImageEntityState(entities: {}),
    homePageState: HomePageState(questions: Pagination.init(questionsPerPage)),
    commentEntityState: const CommentEntityState(entities: {}),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, isRoot: false, content: "", hintText: ""),
    notificationEntityState: const NotificationEntityState(entities: {},isUnviewedNotificationsLoaded: false,isLast: false,lastId: null),
    messageEntityState: const MessageEntityState(entities: {}),
    messageHomePageState: const MessageHomePageState(isLastConversations: false, isSynchronized: false),
    createMessageState: const CreateMessageState(content: null, images: [], receiverId: null)
  ),
  middleware: [

    //Comment entity state middleware
    getNextPageCommentLikesIfNoPageMiddleware,
    getNextPageCommentLikesMiddleware,
    likeCommentMiddleware,
    dislikeCommentMiddleware,
    getNextPageCommentRepliesMiddleware,
    getNextPageCommentRepliesIfNoPageMiddleware,
    getNextPageCommentRepliesIfReadyMiddleware,

    //Home page state
    getNextPageHomeQuestionsMiddleware,
    getNextPageHomeQuestionsIfNoPageMiddleware,
    getNextPageHomeQuestionsIfReadyMiddleware,
    
    //account start
    initAppMiddleware,
    confirmEmailMiddleware,
    loginByPasword,
    createAccountMiddleware,
    logOutMiddleware,
    //account end

    //user entity state
    loadUserMiddleware,
    loadUserByUserNameMiddleware,

    makeFollowRequestMiddleware,
    cancelFollowRequestMiddleware,

    getNextPageUserMessageIfNoPageMiddleware,
    getNextPageUserMessageIfReadyMiddleware,
    getNextPageUserMessagesMiddleware,

    getNextPageUserFollowedsIfNoPageMiddleware,
    getNextPageUserFollowedsIfReadyMiddleware,
    getNextPageUserFollowedsMiddleware,

    getNextPageUserFollowersIfNoPageMiddleware,
    getNextPageUserFollowersIfReadyMiddleware,
    getNextPageUserFollowersMiddleware,

    getNextPageUserQuestionsIfNoPageMiddleware,
    getNextPageUserQuestionsIfReadyMiddleware,
    nextPageOfUserQuestionsMiddleware,

    updateUserNameMiddleware,
    //user end

    //user image start
    loadUserImageMiddleware,
    updateCurrentUserImageMiddleware,
    removeCurrentUserImageMiddleware,
    //user imgage end

    //search state
    getFirstPageSearchingUsersIfNoPageMiddleware,
    getFirstPageSearchingUsersMiddleware,
    getNextPageSearchingUsersIfReadyMiddleware,
    getNextPageSearchingUsersMiddleware,
    //search end
    
    //Exam entity state
    getAllExamsMiddleware,
    loadSubjectsOfSelectedExamMiddleware,
    getNextPageExamQeuestionsMiddleware,
    getNextPageOfExamQuestionsIfNoPageMiddleware,
    getNextPageExamQuestionsIfReadyMiddleware,

    //subject entity state
    getNextPageSubjectQuestionsIfNoPageMiddleware,
    getNextPageSubjectQuestionsIfReadyMiddleware,
    getNextPageSubjectQuestionsMiddleware,
    loadSubjectTopicsMiddleware,

    //Topic start
    getNextPageTopicQuestionsMiddleware,
    getNextPageTopicQuestionsIfNoPageMiddleware,
    getNextPageTopicQuestionsIfReadyMiddeware,
    //Topic end

    // Questions entity state
    loadQuestionMiddleware,
    createQuestionMiddleware,
    likeQuestionMiddleware,
    dislikeQuestionMiddleware,
    
    getNextPageQuestionSolutionIfNoPageMiddleware,
    getNextPageQuestionSolutionsIfReadyMiddleware,
    getNextPageQuestionSolutionsMiddleware,
    
    // Question image start
    loadQuestionImageMiddleware,
    // Question image end

    //solution entity state
    loadSolutionMiddleware,
    createSolutionMiddleware,
    makeUpvoteMiddleware,
    makeDownvoteMiddleware,
    removeUpvoteMiddleware,
    removeDownvoteMiddleware,
    getNextPageSolutionCommentsMiddleware,
    getNextPageSolutionCommentsIfNoPageMiddleware,
    //solution end

    //Solution image start
    loadSolutionImageMiddleware,
    //Solution image end

    //comments entity state
    createCommentMiddleware,
    nextPageQuestionCommentsMiddleware,
    getNextPageQuestionCommentsIfNoPageCommentsMiddleware,
    getNextPageQuestionCommentIfReadyMiddleware,
    loadCommentMiddleware,

    //notifications start
    markNotificationsAsViewedMiddleware,
    loadUnviewedNotificationMiddleware,
    nextPageNotificationsMiddleware,
    nextPageNotificationsIfNoNoficationsMiddleware,
    //notifications end

    //conversations start
    nextPageConversationsMiddleware,
    nextPageConversationsIfNoConversationsMiddleware,
    //conversations end

    //message
    markComingMessageAsReceivedMiddleware,
    markComingMessageAsViewedMiddleware,
    markComingMessagesAsReceivedMiddleware,
    markComingMessagesAsViewedMiddleware,
    loadMessageImageMiddleware,
    
    createMessageWithImagesMiddleware,
    createMessageMiddleware,
    
    getComingMessagesMiddleware,

  ]
);