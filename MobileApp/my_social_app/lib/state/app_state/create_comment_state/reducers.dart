import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:redux/redux.dart';

CreateCommentState changeContentReducer(CreateCommentState prev,ChangeContentAction action)
  => prev.changeContent(action.content);
CreateCommentState changeQuestionReducer(CreateCommentState prev,ChangeQuestionAction action)
  => prev.changeQuestion(action.question);
CreateCommentState changeSolutionReducer(CreateCommentState prev,ChangeSolutionAction action)
  => prev.changeSolution(action.solution);
CreateCommentState changeCommentReducer(CreateCommentState prev,ChangeCommentAction action)
  => prev.changeComment(action.comment);
CreateCommentState cancelReplyReducer(CreateCommentState prev,CancelReplyAction action)
  => prev.cancelReply();
CreateCommentState clearReducer(CreateCommentState prev,ClearCreateCommentStateAction action)
  => prev.clear();

Reducer<CreateCommentState> createCommentStateReducers = combineReducers<CreateCommentState>([
  TypedReducer<CreateCommentState,ChangeContentAction>(changeContentReducer).call,
  TypedReducer<CreateCommentState,ChangeQuestionAction>(changeQuestionReducer).call,
  TypedReducer<CreateCommentState,ChangeSolutionAction>(changeSolutionReducer).call,
  TypedReducer<CreateCommentState,ChangeCommentAction>(changeCommentReducer).call,
  TypedReducer<CreateCommentState,CancelReplyAction>(cancelReplyReducer).call,
  TypedReducer<CreateCommentState,ClearCreateCommentStateAction>(clearReducer).call,
]);