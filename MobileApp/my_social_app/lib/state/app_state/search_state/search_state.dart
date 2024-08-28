import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination/id_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class SearchState{
  final int activePage;
  final String key;
  final String userKey;
  final String questionKey;
  final int? examId;
  final int? subjectId;
  final int? topicId;
  final Pagination<num,IdState> questions;
  final Pagination<num,IdState> users;
  final Pagination<num,> searchedUsers;

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
        users: users.startLoadingNext(),
        searchedUsers: searchedUsers
      );
  SearchState addFirstPageUsers(Iterable<IdState> ids)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addfirstPage(ids),
        searchedUsers: searchedUsers
      );
  SearchState addNextPageUsers(Iterable<IdState> ids)
    => SearchState(
        activePage: activePage,
        key: key,
        questionKey: questionKey,
        userKey: userKey,
        examId: examId,
        subjectId: subjectId,
        topicId: topicId,
        questions: questions,
        users: users.addNextPage(ids),
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
        searchedUsers: searchedUsers.startLoadingNext()
      );
  SearchState addNextPageSearchedUsers(Iterable<IdState> ids)
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
        searchedUsers: searchedUsers.addNextPage(ids)
      );
  SearchState addSearchedUser(IdState id)
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
        searchedUsers: searchedUsers.prependOneAndRemovePrev(id)
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
        searchedUsers: searchedUsers.where((x) => x.)
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
        questions: questions.startLoadingNext(),
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
        questions: questions.addNextPage(questionIds),
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