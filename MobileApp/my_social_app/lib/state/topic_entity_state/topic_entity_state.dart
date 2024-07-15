import 'package:flutter/material.dart';

@immutable
class TopicState{
  final int id;
  final int subjectId;
  final String name;

  const TopicState({required this.id,required this.subjectId, required this.name});
}

@immutable
class TopicEntityState{
  final Map<int,bool> status;
  final List<TopicState> topics;

  const TopicEntityState({required this.status, required this.topics});
  
  bool isLoaded(int? subjectId) => status[subjectId] ?? false;
  List<TopicState> getTopics(int? subjectId) => topics.where((x) => x.subjectId == subjectId).toList();

  Map<int,bool> _changeStatus(int subjectId){
    final Map<int,bool> status = {};
    status.addAll(this.status);
    status[subjectId] = true;
    return status;
  }

  TopicEntityState load(int subjectId,List<TopicState> topics)
    => TopicEntityState(status: _changeStatus(subjectId), topics: this.topics.followedBy(topics).toList());

}