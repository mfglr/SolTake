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
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_entity_state.dart';
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
  final SolutionUserVoteEntityState solutionUserVoteEntityState;
  
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
    required this.solutionUserVoteEntityState,
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

  //select users
  UserState? get currentUser => userEntityState.entities[accountState!.id];
  Iterable<UserState> get searchedUsers 
    => searchState.users.ids.map((e) => userEntityState.entities[e]!);
  Iterable<UserState> selectNotFolloweds(int userId)
    => userEntityState.entities[userId]!.notFolloweds.ids.map((e) => userEntityState.entities[e]!);
  Iterable<UserState> get selectSearchedUsers
    => searchState.searchedUsers.ids.map((e) => userEntityState.entities[userSearchEntityState.entities[e]!.searchedId]!);
  Iterable<UserState> selectFollowers(int userId)
    => userEntityState.entities[userId]!.followers.ids.map(
        (e) => userEntityState.entities[followEntityState.entities[e]!.followerId]!
      );
  Iterable<UserState> selectFolloweds(int userId)
    => userEntityState.entities[userId]!.followeds.ids.map(
        (e) => userEntityState.entities[followEntityState.entities[e]!.followedId]!
      );
  Iterable<UserState> selectQuestionLikes(int questionId)
    => questionEntityState.entities[questionId]!.likes.ids.map(
      (e) => userEntityState.entities[questionUserLikeEntityState.entities[e]!.appUserId]!
    );
  Iterable<UserState> selectCommentLikes(int commentId)
    => commentEntityState.entities[commentId]!.likes.ids.map(
      (e) => userEntityState.entities[commentUserLikeEntityState.entities[e]!.appUserId]!
    );
  Iterable<UserState> selectSolutionUpvotes(int solutionId)
    => solutionEntityState.entities[solutionId]!.upvotes.ids.map(
      (voteId) => userEntityState.entities[solutionUserVoteEntityState.entities[voteId]!.appUserId]!
    );
  Iterable<UserState> selectSolutionDownvotes(int solutionId)
    => solutionEntityState.entities[solutionId]!.downvotes.ids.map(
      (voteId) => userEntityState.entities[solutionUserVoteEntityState.entities[voteId]!.appUserId]!
    );

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
  Iterable<QuestionState> selectUserSolvedQuestions(int userId)
    => userEntityState.entities[userId]!.solvedQuestions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> selectUserUnsolvedQuestions(int userId)
    => userEntityState.entities[userId]!.unsolvedQuestions.ids.map((e) => questionEntityState.entities[e]!);
  Iterable<QuestionState> get selectSearchQuestions
    => searchState.questions.ids.map((e) => questionEntityState.entities[e]!);
  
  //SelectSolutions
  Iterable<SolutionState> selectQuestionSolutions(int questionId)
    => questionEntityState.entities[questionId]!.solutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionCorrectSolutions(int questionId)
    => questionEntityState.entities[questionId]!.correctSolutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionPendingSolutions(int questionId)
    => questionEntityState.entities[questionId]!.pendingSolutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionIncorrectSolutions(int questionId)
    => questionEntityState.entities[questionId]!.incorrectSolutions.ids.map((e) => solutionEntityState.entities[e]!);

  //Select comments
  Iterable<CommentState> getQuestionComments(int questionId)
    => questionEntityState.entities[questionId]?.comments.ids.map((e) => commentEntityState.entities[e]!) ?? [];
  Iterable<CommentState> getFormatedQuestionComments(int id,int questionId)
    => questionEntityState.entities[questionId]!.comments.merge(id).map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> getSolutionComments(int solutionId)
    => solutionEntityState.entities[solutionId]!.comments.ids.map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> getFormatedSolutionComments(int id,int solutionId)
    => solutionEntityState.entities[solutionId]!.comments.merge(id).map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> selectCommentReplies(int commentId)
    => commentEntityState.entities[commentId]!.replies.ids.map((e) => commentEntityState.entities[e]!);
  Iterable<CommentState> selectFormattedCommentReplies(int id,int commentId)
    => commentEntityState.entities[commentId]!.replies.merge(id).map((e) => commentEntityState.entities[e]!);

  //Select Subjects
  Iterable<SubjectState> get subjectsOfSelectedExam 
    => examEntityState.entities[createQuestionState.examId!]!.subjects.ids.map((e) => subjectEntityState.entities[e]!);
  Iterable<SubjectState> selectExamSubjects(int examId)
    => examEntityState.entities[examId]!.subjects.ids.map((e) => subjectEntityState.entities[e]!);

  // select topics
  Iterable<TopicState> get topicsOfSelecetedSubject
    => topicEntityState.getSubjectTopics(createQuestionState.subjectId);
  Iterable<TopicState> selectSubjectTopics(int subjectId)
    => subjectEntityState.entities[subjectId]!.topics.ids.map((e) => topicEntityState.entities[e]!);
}