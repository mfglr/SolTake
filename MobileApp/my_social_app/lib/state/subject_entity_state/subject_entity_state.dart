import 'package:flutter/material.dart';

@immutable
class SubjectState{
  final int id;
  final int examId;
  final String name;
  const SubjectState({required this.id,required this.examId,required this.name});
}

@immutable
class SubjectEntityState{
  final Map<int,bool> status;
  final List<SubjectState> subjects;
  const SubjectEntityState({required this.status,required this.subjects});

  bool isLoaded(int? examId) => status[examId] ?? false;
  List<SubjectState> getSubjects(int? examId) => subjects.where((x) => x.examId == examId).toList();

  Map<int,bool> _changeStatus(int examId){
    final Map<int,bool> status = {};
    status.addAll(this.status);
    status[examId] = true;
    return status;
  }

  SubjectEntityState load(int examId,List<SubjectState> subjects)
    => SubjectEntityState(status: _changeStatus(examId), subjects: this.subjects.followedBy(subjects).toList());
}