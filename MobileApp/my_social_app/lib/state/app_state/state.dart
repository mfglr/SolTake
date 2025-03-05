import 'dart:core';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';


@immutable
class AppState{
  final EntityState<num,QuestionState> questionEntityState;
  final Pagination<num,Id<num>> homePageQuestions;
  final EntityState<num,ExamState> examEntityState;
  final Pagination<num,Id<num>> appExams;
  final Pagination<num,NotificationState> notifications;
  final EntityState<num,SubjectState> subjectEntityState;
  final Pagination<int,SearchUserState> searchUsers;
  final bool isInitialized;
  final ActiveAccountPage activeAccountPage;
  final String? accessToken;
  final LoginState? loginState;
  final EntityState<num,UserState> userEntityState;
  final SearchState searchState;
  final EntityState<num,TopicState> topicEntityState;
  final EntityState<num,SolutionState> solutionEntityState;
  final EntityState<num,SolutionUserVoteState> solutionUserVoteEntityState;
  final EntityState<num,SolutionUserSaveState> solutionUserSaveEntityState;
  final EntityState<num,CommentState> commentEntityState;
  final EntityState<num,CommentUserLikeState> commentUserLikeEntityState;
  final CreateCommentState createCommentState;
  final EntityState<num,MessageState> messageEntityState;
  final Pagination<num,Id<num>> conversations;
  final EntityState<num,UserSearchState> userSearchEntityState;
  final PolicyState policyState;
  final Pagination<num,Id<num>> videoQuestions;
  final UploadEntityState uploadEntityState;

  const AppState({
    required this.questionEntityState,
    required this.homePageQuestions,
    required this.examEntityState,
    required this.appExams,
    required this.conversations,
    required this.searchUsers,
    required this.activeAccountPage,
    required this.accessToken,
    required this.loginState,
    required this.isInitialized,
    required this.userEntityState,
    required this.searchState,
    required this.subjectEntityState,
    required this.topicEntityState,
    required this.solutionEntityState,
    required this.solutionUserVoteEntityState,
    required this.solutionUserSaveEntityState,
    required this.commentEntityState,
    required this.commentUserLikeEntityState,
    required this.createCommentState,
    required this.notifications,
    required this.messageEntityState,
    required this.userSearchEntityState,
    required this.policyState,
    required this.videoQuestions,
    required this.uploadEntityState
  });

  AppState clear() => AppState(
    questionEntityState: EntityState(),
    homePageQuestions: Pagination.init(questionsPerPage, true),
    examEntityState: EntityState(),
    appExams: Pagination.init(examsPerPage, true),
    conversations: Pagination.init(conversationsPerPage,true),
    searchUsers: Pagination.init(usersPerPage, true),
    activeAccountPage: ActiveAccountPage.loginPage,
    accessToken: null,
    loginState: null,
    isInitialized: true,
    userEntityState: EntityState(),
    searchState: SearchState(
      key: "",examId: null,subjectId: null,topicId: null,
      questions: Pagination.init(questionsPerPage,true),
      users: Pagination.init(usersPerPage,true),
      searchedUsers: Pagination.init(usersPerPage,true)
    ),
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
    commentUserLikeEntityState: EntityState(),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, content: ""),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    userSearchEntityState: EntityState(),
    solutionUserVoteEntityState: EntityState(),
    solutionUserSaveEntityState: EntityState(),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    videoQuestions: Pagination.init(questionsPerPage, true),
    uploadEntityState: UploadEntityState.init()
  );


  //select messages
  Iterable<MessageState> get selectConversations => 
    groupBy(messageEntityState.values, (x) => x.conversationId)
    .values
    .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last)
    .sorted((x,y) => y.id.compareTo(x.id));
  Iterable<MessageState> selectUserMessages(num userId)
    => userEntityState
        .getValue(userId)!.messages.values
        .map((e) => e.id)
        .map((e) => messageEntityState.getValue(e)!);
  Iterable<num> get selectIdsOfNewComingMessages
    => messageEntityState.values
        .where((e) => e.state == MessageStatus.created && e.senderId != loginState!.id)
        .map((e) => e.id);
  int get selectNumberOfComingMessages
    => messageEntityState.values
        .where((e) => e.state != MessageStatus.viewed && e.senderId != loginState!.id)
        .length;

  //select users
  UserState? get currentUser => userEntityState.getValue(loginState!.id);
  Iterable<UserState> get searchedUsers 
    => searchState.users.values
        .map((e) => userEntityState.getValue(e.id)!);
  Iterable<UserState> get selectSearchedUsers
    => searchState.searchedUsers.values
        .map((e) => userEntityState.getValue(userSearchEntityState.getValue(e.id)!.searchedId)!);
  Iterable<UserState> selectCommentLikes(num commentId)
    => commentEntityState
        .getValue(commentId)!.likes.values
        .map((e) => userEntityState.getValue(commentUserLikeEntityState.getValue(e.id)!.userId)!);
  Iterable<UserState> selectSolutionUpvotes(num solutionId)
    => solutionEntityState
        .getValue(solutionId)!.upvotes.values
        .map((id) => userEntityState.getValue(solutionUserVoteEntityState.getValue(id.id)!.userId)!);
  Iterable<UserState> selectSolutionDownvotes(num solutionId)
    => solutionEntityState.getValue(solutionId)!.downvotes.values
        .map((id) => userEntityState.getValue(solutionUserVoteEntityState.getValue(id.id)!.userId)!);
  Iterable<UserState> selectUserConversations(num userId)
    => userEntityState
        .getValue(userId)!.conversations.values
        .map((id) => userEntityState.getValue(id.id)!);

  //Select questions
  Iterable<QuestionState> get selectHomePageQuestions
    => homePageQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectExamQuestions(num examId)
    => examEntityState.getValue(examId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectSubjectQuestions(num subjectId)
    => subjectEntityState.getValue(subjectId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectTopicQuestions(num topicId)
    => topicEntityState.getValue(topicId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserQuestions(num userId)
    => userEntityState.getValue(userId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserSolvedQuestions(num userId)
    => userEntityState.getValue(userId)!.solvedQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserUnsolvedQuestions(num userId)
    => userEntityState.getValue(userId)!.unsolvedQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  // Iterable<QuestionState> selectUserSavedQuestions(int userId) =>
  //   userEntityState.getValue(userId)!.savedQuestions.values.map(
  //     (saveId) => questionEntityState.entities[questionUserSaveEntityState.entities[saveId]!.questionId]!
  //   );
  Iterable<QuestionState> get selectSearchQuestions
    => searchState.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  QuestionState? selectQuestion(int questionId) => questionEntityState.getValue(questionId);


  //SelectSolutions
  Iterable<SolutionState> selectQuestionSolutions(num questionId)
    => questionEntityState.getValue(questionId)!.solutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionCorrectSolutions(num questionId)
    => questionEntityState.getValue(questionId)!.correctSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionPendingSolutions(num questionId)
    => questionEntityState.getValue(questionId)!.pendingSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionIncorrectSolutions(num questionId)
    => questionEntityState.getValue(questionId)!.incorrectSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectUserSavedSolutions(num userId) =>
    userEntityState.getValue(userId)!.savedSolutions.values
    .map((e) => solutionEntityState.getValue(solutionUserSaveEntityState.getValue(e.id)!.solutionId)!);
  Iterable<SolutionState> selectQuestionVideoSolutions(num questionId) =>
    questionEntityState.getValue(questionId)!.videoSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);

  //Select comments
  Iterable<CommentState> getQuestionComments(num questionId)
    => questionEntityState.getValue(questionId)!.comments.values.map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getFormatedQuestionComments(num id,num questionId)
    => questionEntityState.getValue(questionId)!.comments.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getSolutionComments(num solutionId)
    => solutionEntityState.getValue(solutionId)!.comments.values.map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getFormatedSolutionComments(num id,num solutionId)
    => solutionEntityState.getValue(solutionId)!.comments.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> selectCommentReplies(num commentId)
    => commentEntityState.getValue(commentId)!.replies.values.map((e) => commentEntityState.getValue(e.id)!).toList().reversed;
  Iterable<CommentState> selectFormattedCommentReplies(num id,num commentId)
    => commentEntityState.getValue(commentId)!.replies.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);

  //select exams
  Iterable<ExamState> get selectExams => appExams.values.map((e) => examEntityState.getValue(e.id)!);

  //Select Subjects
  Iterable<SubjectState> selectExamSubjects(num examId)
    => examEntityState.getValue(examId)!.subjects.values.map((e) => subjectEntityState.getValue(e.id)!);

  // select topics
  Iterable<TopicState> selectSubjectTopics(num subjectId)
    => subjectEntityState.getValue(subjectId)!.topics.values.map((e) => topicEntityState.getValue(e.id)!);

  //select privacy policy
  String? get selectPrivacyPolicy => policyState.privacyPolicies[loginState?.language];
  //select terms of use
  String? get selectTermsOfUse => policyState.termOfUses[loginState?.language];

  //select video questions
  Iterable<QuestionState> get selectVideoQuestions => 
    videoQuestions.values.map((id) => questionEntityState.getValue(id.id)!);
}