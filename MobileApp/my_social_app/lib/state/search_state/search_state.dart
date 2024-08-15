import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination.dart';

@immutable
class SearchState{
  final int activePage;
  final String key;
  final String userKey;
  final String questionKey;
  final int? examId;
  final int? subjectId;
  final int? topicId;
  final Pagination questions;
  final Pagination users;
  final Pagination searchedUsers;

  const SearchState({
    required this.activePage,
    required this.key,
    required this.questionKey,
    required this.userKey,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.questions,
    required this.users,
    required this.searchedUsers
  });
  
  SearchState startLoadingUsers()
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.startLoading(),
        searchedUsers: searchedUsers
      );
  SearchState addFirstPageUsers(Iterable<int> userIds)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addfirstPage(userIds),
        searchedUsers: searchedUsers
      );
  SearchState addNextPageUsers(Iterable<int> userIds)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.appendNextPage(userIds),
        searchedUsers: searchedUsers
      );

  SearchState startLodingSearchedUsers()
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId:
        subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.startLoading()
      );
  SearchState addNextPageSearchedUsers(Iterable<int> userIds)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId, 
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.appendNextPage(userIds)
      );
  SearchState addSearchedUser(int userId)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.prependOneAndRemovePrev(userId)
      );
  SearchState removeSearchedUser(int userId)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers.removeOne(userId)
      );
    

  SearchState startLoadingQuestions()
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.startLoading(),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addFirstPageQuestions(Iterable<int> questionIds)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.addfirstPage(questionIds),
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState addNextPageQuestions(Iterable<int> questionIds)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions.appendNextPage(questionIds),
        users: users,
        searchedUsers: searchedUsers
      );

  SearchState changeActivePage(int activePage)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: activePage ==  0 ? key : questionKey,
        userKey: activePage ==  1 ? key : userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeKey(String key)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: activePage ==  0 ? key : questionKey,
        userKey: activePage ==  1 ? key : userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeExamId(int examId)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: null,
        topicId: null,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeSubjectId(int subjectId)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: null,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState changeTopicId(int topicId)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users,
        searchedUsers: searchedUsers
      );
  SearchState clear()
    => SearchState(
        activePage: activePage,
        key: "",
        questionKey: "",
        userKey: "",
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: Pagination.init(usersPerPage),
        searchedUsers: searchedUsers
      );
}