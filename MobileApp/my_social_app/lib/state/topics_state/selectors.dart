import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/state/topics_state/topics_state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,TopicState> selectSubjectTopicsFromState(TopicsState state, int subjectId) =>
  state.subjectTopics[subjectId] ?? Pagination.init(topicsPerPage, true);
Pagination<int,TopicState> selectSubjectTopics(Store<AppState> store, int subjectId) =>
  selectSubjectTopicsFromState(store.state.topics, subjectId);
Future<bool> onSubjectTopicsLoaded(Store<AppState> store, int subjectId) =>
  store.onChange.map((state) => !selectSubjectTopicsFromState(state.topics, subjectId).loadingNext).first;