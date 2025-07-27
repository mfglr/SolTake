import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';

@immutable
class SearchPageState {
  final ExamState? exam;
  final SubjectState? subject;
  final TopicState? topic;

  const SearchPageState({
    required this.exam,
    required this.subject,
    required this.topic
  });

  SearchPageState changeExam(ExamState? exam) =>
    SearchPageState(
      exam: exam,
      subject: this.exam?.id == exam?.id ? subject : null,
      topic: this.exam?.id == exam?.id ? topic : null
    );
  SearchPageState changeSubject(SubjectState? subject) =>
    SearchPageState(
      exam: exam,
      subject: subject,
      topic: this.subject?.id == subject?.id ? topic : null
    );
  SearchPageState changeTopic(TopicState? topic) =>
    SearchPageState(
      exam: exam,
      subject: subject,
      topic: topic
    );
}