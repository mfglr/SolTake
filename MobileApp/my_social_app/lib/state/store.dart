import 'package:my_social_app/state/account_state/middlewares.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/exam_entity_state/middlewares.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/middlewares.dart';
import 'package:my_social_app/state/question_entity_state/middlewares.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/reducer.dart';
import 'package:my_social_app/state/search_state/middlewares.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/middlewares.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/topic_entity_state/middlewares.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

final store = Store(
  appReducer,
  initialState: const AppState(
    accessToken: null,
    accountState: null,
    activeLoginPage: ActiveLoginPage.loginPage,
    isInitialized: false,
    userEntityState: UserEntityState(users: {}),
    searchState: SearchState(key: "", users: Ids(ids: [], isLast: false, lastId: null)),
    createQuestionState: CreateQuestionState(images: [],examId: null, subjectId: null, topicIds: [], content: null),
    examEntityState: ExamEntityState(exams: [], isLoaded: false),
    subjectEntityState: SubjectEntityState(status: {}, subjects: []),
    topicEntityState: TopicEntityState(status: {}, topics: []),
    questionEntityState: QuestionEntityState(questions: {})
  ),
  middleware: [
    initAppMiddleware,
    confirmEmailMiddleware,
    loginByPasword,
    createAccountMiddleware,
    logOutMiddleware,

    loadUserMiddleware,
    loadFollowersIfNoUsersMiddleware,
    loadFollowersMiddleware,
    loadFollowedsMiddleware,
    loadUserImageMiddleware,
    makeFollowRequestMiddleware,
    cancelFollowRequestMiddleware,

    searchMiddleware,
    nextPageSearchingMiddleware,

    loadExamsMiddleware,

    loadSubjectsMiddelware,
    
    loadTopicsMiddelware,

    createQuestionMiddleware,
    loadQuestionsByUserIdMiddleware,
    loadQuestionImageMiddleware
  ]
);