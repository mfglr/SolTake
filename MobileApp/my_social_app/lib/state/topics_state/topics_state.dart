import 'package:flutter/material.dart';
import 'package:my_social_app/state/topics_state/selectors.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/packages/entity_state/map_extentions.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';

@immutable
class TopicsState {
  final Map<int,Pagination<int, TopicState>> subjectTopics;
  const TopicsState({required this.subjectTopics});

  // subject topics
  TopicsState startLoadingNextSubjectTopics(int subjectId) =>
    TopicsState(
      subjectTopics: subjectTopics.setOne(
        subjectId,
        selectSubjectTopicsFromState(this, subjectId).startLoadingNext()
      )
    );
  TopicsState addNextPageSubjectTopics(int subjectId, Iterable<TopicState> topics) =>
    TopicsState(
      subjectTopics: subjectTopics.setOne(
        subjectId,
        selectSubjectTopicsFromState(this, subjectId).addNextPage(topics)
      )
    );
  TopicsState refreshSubjectTopics(int subjectId, Iterable<TopicState> topics) =>
    TopicsState(
      subjectTopics: subjectTopics.setOne(
        subjectId,
        selectSubjectTopicsFromState(this, subjectId).refreshPage(topics)
      )
    );
  TopicsState stopLoadingNextSubjectTopics(int subjectId) =>
    TopicsState(
      subjectTopics: subjectTopics.setOne(
        subjectId,
        selectSubjectTopicsFromState(this, subjectId).stopLoadingNext()
      )
    );
  // subject topics
}
