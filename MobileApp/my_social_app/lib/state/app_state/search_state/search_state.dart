import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state/Id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class SearchState{
  final String key;
  final int? examId;
  final int? subjectId;
  final int? topicId;
  final Pagination<num,Id<num>> questions;
  final Pagination<num,Id<num>> users;
  final Pagination<num,Id<num>> searchedUsers;

  const SearchState({
    required this.key,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.questions,
    required this.users,
    required this.searchedUsers
  });
  
  SearchState startLoadingNextUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.startLoadingNext(),
        searchedUsers: searchedUsers
      );
  SearchState stopLoadingNextUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.stopLoadingNext(),
        searchedUsers: searchedUsers
      );
  SearchState addFirstUsers(Iterable<num> userIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addfirstPage(userIds.map((userId) => Id(id: userId))),
        searchedUsers: searchedUsers
      );
  SearchState addNextUsers(Iterable<num> userIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addNextPage(userIds.map((userId) => Id(id: userId))),
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
  SearchState stopLodingSearchedUsers()
    => SearchState(
        key: key,
        examId: examId,
        subjectId:
        subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.stopLoadingNext()
      );
  SearchState addNextPageSearchedUsers(Iterable<num> searchIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId, 
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.addNextPage(searchIds.map((e) => Id(id: e)))
      );
  SearchState addSearchedUser(int addedOne,int removeOne)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.prependOneAndRemoveOne(Id(id: addedOne),removeOne)
      );
  SearchState removeSearchedUser(int searchId)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.where((e) => e.id != searchId)
      );

  SearchState startLoadingNextQuestions()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.startLoadingNext(),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState stopLoadingNextQuestions()
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.stopLoadingNext(),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addFirstQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.addfirstPage(questionIds.map((questionId) => Id(id: questionId))),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addNextQuestions(Iterable<int> questionIds)
    => SearchState(
        key: key,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.addNextPage(questionIds.map((questionId) => Id(id: questionId))),
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