import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/create_message_state/create_message_state.dart';
import 'package:my_social_app/state/app_state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/app_state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_entity_state.dart';
import 'package:my_social_app/state/app_state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_entity_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/message_home_page_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_entity_state.dart';
import "package:collection/collection.dart";
import 'package:my_social_app/state/app_state/user_search_state/user_search_entity_state.dart';

enum ActiveLoginPage{
  loginPage,
  registerPage
}

@immutable
class AppState{
  final String? accessToken;
  final AccountState? accountState;
  final ActiveLoginPage activeLoginPage;
  final bool isInitialized;
  final UserEntityState userEntityState;
  final FollowEntityState followEntityState;
  final UserImageEntityState userImageEntityState;
  final SearchState searchState;
  final CreateQuestionState createQuestionState;
  final CreateSolutionState createSolutionState;
  final ExamEntityState examEntityState;
  final SubjectEntityState subjectEntityState;
  final TopicEntityState topicEntityState;
  final SolutionEntityState solutionEntityState;
  final HomePageState homePageState;
  final CommentEntityState commentEntityState;
  final CommentUserLikeEntityState commentUserLikeEntityState;
  final CreateCommentState createCommentState;
  final NotificationEntityState notificationEntityState;
  final MessageEntityState messageEntityState;
  final MessageHomePageState messageHomePageState;
  final CreateMessageState createMessageState;
  final UserSearchEntityState userSearchEntityState;
  final QuestionEntityState questionEntityState;
  final QuestionUserLikeEntityState questionUserLikeEntityState;

  const AppState({
    required this.accessToken,
    required this.accountState,
    required this.activeLoginPage,
    required this.isInitialized,
    required this.userEntityState,
    required this.userImageEntityState,
    required this.searchState,
    required this.createQuestionState,
    required this.createSolutionState,
    required this.examEntityState,
    required this.subjectEntityState,
    required this.topicEntityState,
    required this.solutionEntityState,
    required this.homePageState,
    required this.commentEntityState,
    required this.commentUserLikeEntityState,
    required this.createCommentState,
    required this.notificationEntityState,
    required this.messageEntityState,
    required this.messageHomePageState,
    required this.createMessageState,
    required this.userSearchEntityState,
    required this.followEntityState,
    required this.questionEntityState,
    required this.questionUserLikeEntityState,
  });

  //select messages
  int? selectLastConversationId(){
    final accountId = accountState!.id;
    final list = groupBy(messageEntityState.containers.values,(x) => x.entity.senderId == accountId ? x.entity.receiverId : x.entity.senderId)
      .values
      .map((list) => list.sorted((x,y) => x.entity.id.compareTo(y.entity.id)).last.entity.id)
      .sorted((x,y) => y.compareTo(x));
    return list.isNotEmpty ? list.last : null;
  }
  int selectNumberOfConversation(){
    final accountId = accountState!.id;
    return groupBy(messageEntityState.containers.values,(x) => x.entity.senderId == accountId ? x.entity.receiverId : x.entity.senderId).length;
  }
  Iterable<MessageState> get selectConversations
    => messageEntityState.selectConversations(accountState!.id);
  Iterable<MessageState> selectUserMessages(int userId)
    => userEntityState.containers[userId]!.entity.messages.ids.map((e) => messageEntityState.containers[e]!.entity);
  Iterable<int> get selectIdsOfNewComingMessages
    => messageEntityState.containers.values
        .where((e) => e.entity.state == MessageStatus.created && e.entity.senderId != accountState!.id)
        .map((e) => e.entity.id);
  int get selectNumberOfComingMessages
    => messageEntityState.containers.values
        .where((e) => e.entity.state != MessageStatus.viewed && e.entity.senderId != accountState!.id)
        .length;

  //select users
  UserState? get currentUser => userEntityState.containers[accountState!.id]?.entity;
  Iterable<UserState> get searchedUsers 
    => searchState.users.ids.map((e) => userEntityState.containers[e]!.entity);
  Iterable<UserState> selectNotFolloweds(int userId)
    => userEntityState.containers[userId]!.entity.notFolloweds.ids.map((e) => userEntityState.containers[e]!.entity);
  Iterable<UserState> get selectSearchedUsers
    => searchState.searchedUsers.ids.map((e) => userEntityState.containers[userSearchEntityState.containers[e]!.entity.searchedId]!.entity);
  Iterable<UserState> selectFollowers(int userId)
    => userEntityState.containers[userId]!.entity.followers.ids.map(
        (e) => userEntityState.containers[followEntityState.containers[e]!.entity.followerId]!.entity
      );
  Iterable<UserState> selectFolloweds(int userId)
    => userEntityState.containers[userId]!.entity.followeds.ids.map(
        (e) => userEntityState.containers[followEntityState.containers[e]!.entity.followedId]!.entity
      );
  Iterable<UserState> selectQuestionLikes(int questionId)
    => questionEntityState.containers[questionId]!.entity.likes.ids.map(
      (e) => userEntityState.containers[questionUserLikeEntityState.containers[e]!.entity.appUserId]!.entity
    );
  Iterable<UserState> selectCommentLikes(int commentId)
    => commentEntityState.containers[commentId]!.entity.likes.ids.map(
      (e) => userEntityState.containers[commentUserLikeEntityState.containers[e]!.entity.appUserId]!.entity
    );

  //Select questions
  Iterable<QuestionState> get selectHomePageQuestions
    => homePageState.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectExamQuestions(int examId)
    => examEntityState.containers[examId]!.entity.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectSubjectQuestions(int subjectId)
    => subjectEntityState.containers[subjectId]!.entity.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectTopicQuestions(int topicId)
    => topicEntityState.containers[topicId]!.entity.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectUserQuestions(int userId)
    => userEntityState.containers[userId]!.entity.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectUserSolvedQuestions(int userId)
    => userEntityState.containers[userId]!.entity.solvedQuestions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> selectUserUnsolvedQuestions(int userId)
    => userEntityState.containers[userId]!.entity.unsolvedQuestions.ids.map((e) => questionEntityState.containers[e]!.entity);
  Iterable<QuestionState> get selectSearchQuestions
    => searchState.questions.ids.map((e) => questionEntityState.containers[e]!.entity);
  
  //SelectSolutions
  Iterable<SolutionState> selectQuestionSolutions(int questionId)
    => questionEntityState.containers[questionId]!.entity.solutions.ids.map((e) => solutionEntityState.containers[e]!.entity);
  Iterable<SolutionState> selectQuestionCorrectSolutions(int questionId)
    => questionEntityState.containers[questionId]!.entity.correctSolutions.ids.map((e) => solutionEntityState.containers[e]!.entity);
  Iterable<SolutionState> selectQuestionPendingSolutions(int questionId)
    => questionEntityState.containers[questionId]!.entity.pendingSolutions.ids.map((e) => solutionEntityState.containers[e]!.entity);
  Iterable<SolutionState> selectQuestionIncorrectSolutions(int questionId)
    => questionEntityState.containers[questionId]!.entity.incorrectSolutions.ids.map((e) => solutionEntityState.containers[e]!.entity);

  //Select comments
  Iterable<CommentState> getQuestionComments(int questionId)
    => questionEntityState.containers[questionId]!.entity.comments.ids.map((e) => commentEntityState.containers[e]!.entity);
  Iterable<CommentState> getFormatedQuestionComments(int id,int questionId)
    => questionEntityState.containers[questionId]!.entity.comments.merge(id).map((e) => commentEntityState.containers[e]!.entity);
  Iterable<CommentState> getSolutionComments(int solutionId)
    => solutionEntityState.containers[solutionId]!.entity.comments.ids.map((e) => commentEntityState.containers[e]!.entity);
  Iterable<CommentState> getFormatedSolutionComments(int id,int solutionId)
    => solutionEntityState.containers[solutionId]!.entity.comments.merge(id).map((e) => commentEntityState.containers[e]!.entity);
  Iterable<CommentState> selectCommentReplies(int commentId)
    => commentEntityState.containers[commentId]!.entity.replies.ids.map((e) => commentEntityState.containers[e]!.entity);
  Iterable<CommentState> selectFormattedCommentReplies(int id,int commentId)
    => commentEntityState.containers[commentId]!.entity.replies.merge(id).map((e) => commentEntityState.containers[e]!.entity);

  //Select Subjects
  Iterable<SubjectState> get subjectsOfSelectedExam 
    => examEntityState.containers[createQuestionState.examId!]!.entity.subjects.ids.map((e) => subjectEntityState.containers[e]!.entity);
  Iterable<SubjectState> selectExamSubjects(int examId)
    => examEntityState.containers[examId]!.entity.subjects.ids.map((e) => subjectEntityState.containers[e]!.entity);

  // select topics
  Iterable<TopicState> get topicsOfSelecetedSubject
    => topicEntityState.getSubjectTopics(createQuestionState.subjectId);
  Iterable<TopicState> selectSubjectTopics(int subjectId)
    => subjectEntityState.containers[subjectId]!.entity.topics.ids.map((e) => topicEntityState.containers[e]!.entity);
}