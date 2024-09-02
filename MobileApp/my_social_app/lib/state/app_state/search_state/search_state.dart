import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class SearchState{
  final String key;
  final int? examId;
  final int? subjectId;
  final int? topicId;
  final Pagination questions;
  final Pagination users;
  final Pagination searchedUsers;

  const SearchState({
    required this.key,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.questions,
    required this.users,
    required this.searchedUsers
  });
  
  SearchState startLoadingUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.startLoadingNext(),
        searchedUsers: searchedUsers
      );
  SearchState addFirstPageUsers(Iterable<int> ids)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addfirstPage(ids),
        searchedUsers: searchedUsers
      );
  SearchState addNextPageUsers(Iterable<int> ids)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addNextPage(ids),
        searchedUsers: searchedUsers
      );

  SearchState startLodingSearchedUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId:
        subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.startLoadingNext()
      );
  SearchState addNextPageSearchedUsers(Iterable<int> searchIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId, 
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.addNextPage(searchIds)
      );
  SearchState addSearchedUser(int addedOne,int removeOne)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.prependOneAndRemoveOne(addedOne,removeOne)
      );
  SearchState removeSearchedUser(int searchId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.removeOne(searchId)
      );

  SearchState startLoadingQuestions()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.startLoadingNext(),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addFirstPageQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.addfirstPage(questionIds),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addNextPageQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.addNextPage(questionIds),
        users: users,
        searchedUsers: searchedUsers
      );

  SearchState changeKey(String key)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeExamId(int examId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: null,
        topicId: null,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeSubjectId(int subjectId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: null,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeTopicId(int topicId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState clearKey()
    => SearchState(
        key: "",
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: Pagination.init(usersPerPage,true),
        searchedUsers: searchedUsers
      );
}