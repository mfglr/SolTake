import 'package:flutter/material.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class SubjectEntityState{
  final Map<int,bool> status;
  final Map<int,SubjectState> subjects;
  const SubjectEntityState({required this.status,required this.subjects});

  bool isLoaded(int? examId) => status[examId] ?? false;
  List<SubjectState> getSubjectsByExamId(int? examId) => subjects.values.where((x) => x.examId == examId).toList();

  Map<int,bool> _changeStatus(int examId){
    final Map<int,bool> status = {};
    status.addAll(this.status);
    status[examId] = true;
    return status;
  }
  Map<int,SubjectState> _addSubjects(Iterable<SubjectState> subjects){
    final Map<int,SubjectState> clone = {};
    final uniqSubjects = subjects.where((e) => this.subjects[e.id] == null);
    clone.addAll(this.subjects);
    clone.addEntries(uniqSubjects.map((e) => MapEntry(e.id, e)));
    return clone;
  }
  Map<int,SubjectState> _addSubject(SubjectState subject){
    final Map<int,SubjectState> clone = {};
    clone.addAll(subjects);
    if(clone[subject.id] == null) clone[subject.id] = subject;
    return clone;
  }

  SubjectEntityState loadByExamId(int examId,Iterable<SubjectState> subjects)
    => SubjectEntityState(status: _changeStatus(examId), subjects: _addSubjects(subjects));
  SubjectEntityState addSubject(SubjectState subject)
    => SubjectEntityState(status: status, subjects: _addSubject(subject));
  SubjectEntityState addSubjects(Iterable<SubjectState> subjects)
    => SubjectEntityState(status: status, subjects: _addSubjects(subjects));

  SubjectEntityState nextPageOfQuestions(int subjectId, Iterable<int> quesionIds){
    final Map<int,SubjectState> clone = {};
    clone.addAll(subjects);
    clone[subjectId] = clone[subjectId]!.nextPageOfQuestions(quesionIds);
    return SubjectEntityState(status: status, subjects: clone);
  }
}