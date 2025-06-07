import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';
import 'package:soltake_broker/state/app_state/login_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/question_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/reducers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

final store = Store(
  reducers,
  initialState: AppState(
    login: LoginContainer.init(),
    questions: Pagination.init(100, false)
  ),
  middleware: [
    //login middlewares
    loginByPasswordMiddleware,
    loginByRefreshTokenMiddleware,

    //question middlewares
    nextAllDraftQuestionMiddleware,
    firstAllDraftQuestionsMiddleware,
    publishQuestionMiddleware,
  ]
);