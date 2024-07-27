import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:redux/redux.dart';

CreateCommentState changeContentReducer(CreateCommentState prev,ChangeContentAction action)
  => prev.changeContent(action.content);
CreateCommentState changeQuestionReducer(CreateCommentState prev,ChangeQuestionAction action)
  => prev.changeQuestion(action.question);
CreateCommentState changeSolutionReducer(CreateCommentState prev,ChangeSolutionAction action)
  => prev.changeSolution(action.solution);
CreateCommentState changeParentReducer(CreateCommentState prev,ChangeCommentAction action)
  => prev.changeComment(action.comment,action.isRoot);
CreateCommentState cancelReplyReducer(CreateCommentState prev,CancelReplyAction action)
  => prev.cancelReply();
CreateCommentState changeCommentFieldReducer(CreateCommentState prev,ChangeHintTextAction action)
  => prev.changeHintText(action.hintText);
CreateCommentState createCommentSuccessReducer(CreateCommentState prev, CreateCommentSuccessAction action)
  => prev.cancelReply();

Reducer<CreateCommentState> createCommentStateReducers = combineReducers<CreateCommentState>([
  TypedReducer<CreateCommentState,ChangeContentAction>(changeContentReducer).call,
  TypedReducer<CreateCommentState,ChangeQuestionAction>(changeQuestionReducer).call,
  TypedReducer<CreateCommentState,ChangeSolutionAction>(changeSolutionReducer).call,
  TypedReducer<CreateCommentState,ChangeCommentAction>(changeParentReducer).call,
  TypedReducer<CreateCommentState,CancelReplyAction>(cancelReplyReducer).call,
  TypedReducer<CreateCommentState,ChangeHintTextAction>(changeCommentFieldReducer).call,
  TypedReducer<CreateCommentState,CreateCommentSuccessAction>(createCommentSuccessReducer).call,
]);