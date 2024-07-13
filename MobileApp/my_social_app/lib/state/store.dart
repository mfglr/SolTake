import 'package:my_social_app/state/account_state/middlewares.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/middlewares.dart';
import 'package:my_social_app/state/reducer.dart';
import 'package:my_social_app/state/search_state/middlewares.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/middlewares.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:redux/redux.dart';

final store = Store(
  reducer,
  initialState: const AppState(
    accountState: null,
    activeLoginPage: ActiveLoginPage.loginPage,
    isInitialized: false,
    userEntityState: UserEntityState(users: {}),
    searchState: SearchState(key: "", users: Ids(ids: [], isLast: false, lastId: null)),
    createQuestionState: CreateQuestionState(images: [],exam: null, subject: null, topicIds: [], content: null),
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
    nextPageSearchingMiddleware
  ]
);