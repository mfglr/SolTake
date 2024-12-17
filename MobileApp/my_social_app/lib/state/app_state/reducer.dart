import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

AppState clearStateReducer(AppState prev,ClearStateAction action) =>
  prev.clear();

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState,ApplicationSuccessfullyInitAction>((p,a) => p.optional(newIsInitialized: true)).call,
  TypedReducer<AppState,ChangeActiveAccountPageAction>((p,a) => p.optional(newActiveAccountPage: a.payload)).call,
  TypedReducer<AppState,ChangeAccessTokenAction>((p,a) => p.optional(newAccessToken: a.payload)).call,
  TypedReducer<AppState,ChangeAccountStateAction>((p,a) => p.optional(newAccountState: a.payload)).call,
  TypedReducer(AppState,)

  TypedReducer<AppState,UpdateExamsAction>((p,a) => p.optional(newExams: a.payload)).call,
  TypedReducer<AppState,ClearStateAction>((p,a) => p.clear()).call,
]);

// AppState appReducer(AppState prev,AppAction action) => AppState(
//   accessToken: changeAccessTokenReducer(prev.accessToken,action),
//   accountState: accoutStateReducers(prev.accountState,action),
//   isInitialized: appSuccessfullyInitReducer(prev.isInitialized,action),
//   userEntityState: userEntityStateReducers(prev.userEntityState, action),
//   userImageEntityState: userImageEntityStateReducers(prev.userImageEntityState,action),
//   searchState: searchStateReducers(prev.searchState,action),
//   examEntityState: examEntityStateReducers(prev.examEntityState,action),
//   subjectEntityState: subjectEntityStateReducers(prev.subjectEntityState, action),
//   topicEntityState: topicEntityStateReducers(prev.topicEntityState, action),
//   solutionEntityState: solutionEntityStateReducers(prev.solutionEntityState,action),
//   homePageState: homePageReducers(prev.homePageState,action),
//   commentEntityState: questionCommentEntityStateReducers(prev.commentEntityState,action),
//   commentUserLikeEntityState: commentUserLikeEntityReducers(prev.commentUserLikeEntityState,action),
//   createCommentState: createCommentStateReducers(prev.createCommentState,action),
//   notificationEntityState: notificationEntityStateReducers(prev.notificationEntityState,action),
//   messageEntityState: messageEntityStateReducers(prev.messageEntityState,action),
//   messageImageEntityState: messageImageEntityReducers(prev.messageImageEntityState,action),
//   messageHomePageState: messageHomePageReducers(prev.messageHomePageState,action),
//   userSearchEntityState: userSearchEntityReducers(prev.userSearchEntityState,action),
//   followEntityState: followEntityReducers(prev.followEntityState,action),
//   questionEntityState: questionsReducer(prev.questionEntityState,action),
//   questionUserLikeEntityState: questionUserLikeEntityReducers(prev.questionUserLikeEntityState,action),
//   questionUserSaveEntityState: questionUserSaveEntityReducers(prev.questionUserSaveEntityState,action),
//   solutionUserVoteEntityState: solutionUserVoteEntityReducers(prev.solutionUserVoteEntityState,action),
//   solutionUserSaveEntityState: solutionUserSaveEntityReducers(prev.solutionUserSaveEntityState,action),
//   exams: examsReducers(prev.exams,action),
//   policyState: policyReducers(prev.policyState,action),
// );

// Reducer<AppState> reducers = combineReducers<AppState>([
//   TypedReducer<AppState,ClearStateAction>(clearStateReducer).call,
//   TypedReducer<AppState,AppAction>(appReducer).call,
// ]);