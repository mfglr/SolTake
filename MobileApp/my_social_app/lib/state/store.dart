import 'package:my_social_app/state/account_state/middlewares.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/create_question_state/middleware.dart';
import 'package:my_social_app/state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/create_solution_state/middlewares.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/middlewares.dart';
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
  initialState: const AppState(
    accessToken: null,
    accountState: null,
    activeLoginPage: ActiveLoginPage.loginPage,
    isInitialized: false,
    userEntityState: UserEntityState(entities: {}),
    userImageEntityState: UserImageEntityState(entities: {}),
    searchState: SearchState(key: "", users: Ids(ids: [], isLast: false, lastId: null)),
    createQuestionState: CreateQuestionState(images: [],examId: null, subjectId: null, topicIds: [], content: null),
    createSolutionState: CreateSolutionState(questionId: null, content: "", images: []),
    examEntityState: ExamEntityState(entities: {}, isLoaded: false),
    subjectEntityState: SubjectEntityState(entities: {}),
    topicEntityState: TopicEntityState(entities: {}),
    questionEntityState: QuestionEntityState(entities: {}),
    questionImageEntityState: QuestionImageEntityState(entities: {}),
    solutionEntityState: SolutionEntityState(entities: {}),
    solutionImageEntityState: SolutionImageEntityState(entities: {})
  ),
  middleware: [
    //account start
    initAppMiddleware,
    confirmEmailMiddleware,
    loginByPasword,
    createAccountMiddleware,
    logOutMiddleware,
    //account end

    //user start
    loadUserMiddleware,
    loadFollowersIfNoUsersMiddleware,
    loadFollowedsIfNoUsersMiddleware,
    loadFollowersMiddleware,
    loadFollowedsMiddleware,
    makeFollowRequestMiddleware,
    cancelFollowRequestMiddleware,
    nextPageOfUserQuestionsMiddleware,

    //user end

    //user image start
    loadUserImageMiddleware,
    //user imgage end

    //search start
    searchMiddleware,
    nextPageSearchingMiddleware,
    //search end
    
    //Exam Start
    loadAllExamsMiddleware,
    loadSubjectsOfSelectedExamReducer,
    nextPageOfExamQeuestionsMiddleware,
    //Exam end

    //subject start
    nextPageOfSubjectQuestionsMiddleware,
    loadSubjectTopicsMiddleware,
    //end

    //Topic start
    nextPageOfTopicQuestionsMiddleware,
    //Topic end

    // Question start
    createQuestionMiddleware,
    likeQuestionMiddleware,
    dislikeQuestionMiddleware,
    nextPageQuestionSolutionsMiddleware,
    // Question end
    
    // Question image start
    loadQuestionImageMiddleware,
    // Question image end

    //solution start
    createSolutionMiddleware,
    markSolutionAsApprovedMiddleware,
    markSolutionAsPendingMiddleware,
    makeUpvoteMiddleware,
    makeDownvoteMiddleware,
    removeUpvoteMiddleware,
    removeDownvoteMiddleware,
    //solution end

    //Solution image start
    loadSolutionImageMiddleware,
    //Solution image end
  ]
);