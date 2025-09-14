import 'package:my_social_app/state/topics_state/actions.dart';
import 'package:my_social_app/state/topics_state/topics_state.dart';
import 'package:redux/redux.dart';

TopicsState nextSubjectTopicsReducer(TopicsState prev, NextSubjectTopicsAction action) =>
  prev.startLoadingNextSubjectTopics(action.subjectId);
TopicsState nextSubjectTopicsSuccessReducer(TopicsState prev, NextSubjectTopicsSuccessAction action) =>
  prev.addNextPageSubjectTopics(action.subjectId, action.topics);
TopicsState nextSubjectTopicsFailedReducer(TopicsState prev, NextSubjectTopicFailedAction action) =>
  prev.stopLoadingNextSubjectTopics(action.subjectId);

TopicsState refreshSubjectTopicsReducer(TopicsState prev, RefreshSubjectTopicsAction action) =>
  prev.startLoadingNextSubjectTopics(action.subjectId);
TopicsState refreshSubjectTopicsSuccessReducer(TopicsState prev, RefreshSubjectTopicsSuccessAction action) =>
  prev.refreshSubjectTopics(action.subjectId, action.topics);
TopicsState refreshSubjectTopicsFailedReducer(TopicsState prev, RefreshSubjectTopicFailedAction action) =>
  prev.stopLoadingNextSubjectTopics(action.subjectId);

Reducer<TopicsState> topicsReducers = combineReducers<TopicsState>([
  TypedReducer<TopicsState,NextSubjectTopicsAction>(nextSubjectTopicsReducer).call,
  TypedReducer<TopicsState,NextSubjectTopicsSuccessAction>(nextSubjectTopicsSuccessReducer).call,
  TypedReducer<TopicsState,NextSubjectTopicFailedAction>(nextSubjectTopicsFailedReducer).call,

  TypedReducer<TopicsState,RefreshSubjectTopicsAction>(refreshSubjectTopicsReducer).call,
  TypedReducer<TopicsState,RefreshSubjectTopicsSuccessAction>(refreshSubjectTopicsSuccessReducer).call,
  TypedReducer<TopicsState,RefreshSubjectTopicFailedAction>(refreshSubjectTopicsFailedReducer).call,
]);