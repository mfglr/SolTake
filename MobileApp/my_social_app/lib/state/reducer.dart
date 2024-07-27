import 'package:my_social_app/state/account_state/reducers.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/create_comment_state/reducers.dart';
import 'package:my_social_app/state/create_question_state/reducers.dart';
import 'package:my_social_app/state/create_solution_state/reducers.dart';
import 'package:my_social_app/state/exam_entity_state/reducers.dart';
import 'package:my_social_app/state/home_page_state/reducers.dart';
import 'package:my_social_app/state/comment_entity_state/reducers.dart';
import 'package:my_social_app/state/question_entity_state/reducers.dart';
import 'package:my_social_app/state/question_image_entity_state/reducers.dart';
import 'package:my_social_app/state/search_state/reducers.dart';
import 'package:my_social_app/state/solution_entity_state/reducers.dart';
import 'package:my_social_app/state/solution_image_entity_state/reducers.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/reducers.dart';
import 'package:my_social_app/state/topic_entity_state/reducers.dart';
import 'package:my_social_app/state/user_entity_state/reducers.dart';
import 'package:my_social_app/state/user_image_entity_state/reducers.dart';

ActiveLoginPage changeActiveLoginPageReducer(ActiveLoginPage oldState,Action action)
  => action is ChangeActiveLoginPageAction ? action.payload : oldState;

String? changeAccessTokenReducer(String? oldState,Action action)
  => action is ChangeAccessTokenAction ? action.accessToken : oldState;

bool appSuccessfullyInitReducer(bool oldState,Action action)
  => action is ApplicationSuccessfullyInitAction ? true : oldState;

AppState appReducer(AppState prev,action) => AppState(
  accessToken: changeAccessTokenReducer(prev.accessToken,action),
  accountState: updateAccountStateReducer(prev.accountState,action),
  activeLoginPage: changeActiveLoginPageReducer(prev.activeLoginPage,action),
  isInitialized: appSuccessfullyInitReducer(prev.isInitialized,action),
  userEntityState: userEntityStateReducers(prev.userEntityState, action),
  userImageEntityState: userImageEntityStateReducers(prev.userImageEntityState,action),
  searchState: searchStateReducers(prev.searchState,action),
  createQuestionState: createQuestionReducers(prev.createQuestionState,action),
  createSolutionState: createrSolutionReducers(prev.createSolutionState,action),
  examEntityState: examEntityStateReducers(prev.examEntityState,action),
  subjectEntityState: subjectEntityStateReducers(prev.subjectEntityState, action),
  topicEntityState: topicEntityStateReducers(prev.topicEntityState, action),
  questionEntityState: questionsReducer(prev.questionEntityState,action),
  questionImageEntityState: questionImageEntityReducers(prev.questionImageEntityState,action),
  solutionEntityState: solutionEntityStateReducers(prev.solutionEntityState,action),
  solutionImageEntityState: solutionImagesStateReducers(prev.solutionImageEntityState,action),
  homePageState: homePageReducers(prev.homePageState,action),
  commentEntityState: questionCommentEntityStateReducers(prev.commentEntityState,action),
  createCommentState: createCommentStateReducers(prev.createCommentState,action)
);

