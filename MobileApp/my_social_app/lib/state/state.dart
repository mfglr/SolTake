import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/create_message_state/create_message_state.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/create_solution_state/create_solution_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/comment_entity_state/comment_entity_state.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/message_entity_state/message_entity_state.dart';
import 'package:my_social_app/state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/message_home_page_state/message_home_page_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_entity_state.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_entity_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_entity_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_entity_state.dart';
import "package:collection/collection.dart";

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
  final UserImageEntityState userImageEntityState;
  final SearchState searchState;
  final CreateQuestionState createQuestionState;
  final CreateSolutionState createSolutionState;
  final ExamEntityState examEntityState;
  final SubjectEntityState subjectEntityState;
  final TopicEntityState topicEntityState;
  final QuestionEntityState questionEntityState;
  final QuestionImageEntityState questionImageEntityState;
  final SolutionEntityState solutionEntityState;
  final SolutionImageEntityState solutionImageEntityState;
  final HomePageState homePageState;
  final CommentEntityState commentEntityState;
  final CreateCommentState createCommentState;
  final NotificationEntityState notificationEntityState;
  final MessageEntityState messageEntityState;
  final MessageHomePageState messageHomePageState;
  final CreateMessageState createMessageState;

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
    required this.questionEntityState,
    required this.questionImageEntityState,
    required this.solutionEntityState,
    required this.solutionImageEntityState,
    required this.homePageState,
    required this.commentEntityState,
    required this.createCommentState,
    required this.notificationEntityState,
    required this.messageEntityState,
    required this.messageHomePageState,
    required this.createMessageState,
  });

  //select messages
  int? selectLastConversationId(){
    final accountId = accountState!.id;
    final list = groupBy(messageEntityState.entities.values,(x) => x.senderId == accountId ? x.receiverId : x.senderId)
      .values
      .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last.id)
      .sorted((x,y) => y.compareTo(x));
    return list.isNotEmpty ? list.last : null;
  }
  int selectNumberOfConversation(){
    final accountId = accountState!.id;
    return groupBy(messageEntityState.entities.values,(x) => x.senderId == accountId ? x.receiverId : x.senderId).length;
  }
  Iterable<MessageState> get selectConversations
    => messageEntityState.selectConversations(accountState!.id);
  Iterable<MessageState> selectUserMessages(int userId)
    => userEntityState.entities[userId]!.messages.ids.map((e) => messageEntityState.entities[e]!);
  Iterable<int> get selectIdsOfNewComingMessages
    => messageEntityState.entities.values
        .where((e) => e.state == MessageStatus.created && e.senderId != accountState!.id)
        .map((e) => e.id);
  int get selectNumberOfComingMessages
    => messageEntityState.entities.values
        .where((e) => e.state != MessageStatus.viewed && e.senderId != accountState!.id)
        .length;
  //select messages

  UserState? get currentUser => userEntityState.entities[accountState!.id];
  Iterable<UserState> get searchedUsers => searchState.users.ids.map((e) => userEntityState.entities[e]!);

  //Select solutionImages
  Iterable<SolutionImageState> getSolutionImages(int solutionId)
    => solutionEntityState.entities[solutionId]!.images.map((e) => solutionImageEntityState.entities[e]!);
  Iterable<SubjectState> get subjectsOfSelectedExam 
    => examEntityState.entities[createQuestionState.examId!]!.subjects.ids.map((e) => subjectEntityState.entities[e]!);
  Iterable<TopicState> get topicsOfSelecetedSubject
    => topicEntityState.getSubjectTopics(createQuestionState.subjectId);

  //Select questions
  Iterable<QuestionState> get selectHomePageQuestions
    => homePageState.questions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> selectExamQuestions(int examId)
    => examEntityState.entities[examId]!.questions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> selectSubjectQuestions(int subjectId)
    => subjectEntityState.entities[subjectId]!.questions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> selectTopicQuestions(int topicId)
    => topicEntityState.entities[topicId]!.questions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> selectUserQuestions(int userId)
    => userEntityState.entities[userId]!.questions.ids.map((e) => questionEntityState.entities[e]!);

  //select quesitonImages
  Iterable<QuestionImageState> selectQuestionImages(int questionId)
    => questionEntityState.entities[questionId]!.images.map((e) => questionImageEntityState.entities[e]!);
    
  //Select comments
  Iterable<CommentState> getQuestionComments(int questionId)
    => questionEntityState.entities[questionId]!.comments.ids.map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> getSolutionComments(int solutionId)
    => solutionEntityState.entities[solutionId]!.comments.ids.map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> selectCommentReplies(int commentId)
    => commentEntityState.entities[commentId]!.replies.ids.map((e) => commentEntityState.entities[e]!);
}