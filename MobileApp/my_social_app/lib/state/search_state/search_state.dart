import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination.dart';

@immutable
class SearchState{
  final String key;
  final int? examId;
  final int? subjectId;
  final int? topicId;
  final int activePage;
  final Pagination questions;
  final Pagination users;

  const SearchState({
    required this.key,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.activePage,
    required this.questions,
    required this.users
  });
  
  SearchState startLoadingUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users.startLoading()
      );
  SearchState addFirstPageUsers(Iterable<int> userIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users.addfirstPage(userIds)
      );
  SearchState addNextPageUsers(Iterable<int> userIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users.appendNextPage(userIds)
      );

  SearchState startLoadingQuestions()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions.startLoading(),
        users: users
      );
  SearchState addFirstPageQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions.addfirstPage(questionIds),
        users: users
      );
  SearchState addNextPageQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions.appendNextPage(questionIds),
        users: users
      );

  SearchState changeActivePage(int activePage)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users
      );
  SearchState changeKey(String key)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users
      );
  SearchState changeExamId(int examId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: null,
        topicId: null,
        activePage: activePage,
        questions: questions,
        users: users
      );
  SearchState changeSubjectId(int subjectId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: null,
        activePage: activePage,
        questions: questions,
        users: users
      );
  SearchState changeTopicId(int topicId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: users
      );
  
  SearchState clear()
    => SearchState(
        key: "",
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        activePage: activePage,
        questions: questions,
        users: Pagination.init(usersPerPage)
      );
}