import 'dart:core';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_user_saves_state/solution_user_save_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';


@immutable
class AppState{
  final Pagination<int,SearchUserState> searchUsers;
  final Pagination<int,Id<int>> searchQuestions;
  final Pagination<int,UserUserSearchState> userUserSearchs;
  final Pagination<int,QuestionUserSaveState> questionUserSaves;
  final Pagination<int,SolutionUserSaveState> solutionUserSaves;
  final EntityState<int,MessageConnectionState> messageConnectionEntityState;

  final EntityState<int,QuestionState> questionEntityState;
  final Pagination<int,Id<int>> homePageQuestions;
  final EntityState<int,ExamState> examEntityState;
  final Pagination<int,Id<int>> appExams;
  final Pagination<int,NotificationState> notifications;
  final EntityState<int,SubjectState> subjectEntityState;
  final bool isInitialized;
  final ActiveAccountPage activeAccountPage;
  final LoginState? loginState;
  final EntityState<int,UserState> userEntityState;
  final EntityState<int,TopicState> topicEntityState;
  final EntityState<int,SolutionState> solutionEntityState;
  final EntityState<int,CommentState> commentEntityState;
  final CreateCommentState createCommentState;
  final EntityState<int,MessageState> messageEntityState;
  final Pagination<int,Id<int>> conversations;
  final EntityState<int,UserSearchState> userSearchEntityState;
  final PolicyState policyState;
  final Pagination<int,Id<int>> videoQuestions;
  final UploadEntityState uploadEntityState;

  const AppState({
    required this.searchUsers,
    required this.searchQuestions,
    required this.userUserSearchs,
    required this.questionUserSaves,
    required this.solutionUserSaves,
    required this.messageConnectionEntityState,

    required this.questionEntityState,
    required this.homePageQuestions,
    required this.examEntityState,
    required this.appExams,
    required this.conversations,
    required this.activeAccountPage,
    required this.loginState,
    required this.isInitialized,
    required this.userEntityState,
    required this.subjectEntityState,
    required this.topicEntityState,
    required this.solutionEntityState,
    required this.commentEntityState,
    required this.createCommentState,
    required this.notifications,
    required this.messageEntityState,
    required this.userSearchEntityState,
    required this.policyState,
    required this.videoQuestions,
    required this.uploadEntityState
  });

  AppState clear() => AppState(
    searchUsers: Pagination.init(usersPerPage, true),
    searchQuestions: Pagination.init(questionsPerPage, true),
    userUserSearchs: Pagination.init(usersPerPage, true),
    questionUserSaves: Pagination.init(questionsPerPage, true),
    solutionUserSaves: Pagination.init(solutionsPerPage, true),
    messageConnectionEntityState: EntityState(),

    questionEntityState: EntityState(),
    homePageQuestions: Pagination.init(questionsPerPage, true),
    examEntityState: EntityState(),
    appExams: Pagination.init(examsPerPage, true),
    conversations: Pagination.init(conversationsPerPage,true),
    activeAccountPage: ActiveAccountPage.loginPage,
    loginState: null,
    isInitialized: true,
    userEntityState: EntityState(),
    subjectEntityState: EntityState(),
    topicEntityState: EntityState(),
    solutionEntityState: EntityState(),
    commentEntityState: EntityState(),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, content: ""),
    notifications: Pagination.init(notificationsPerPage, true),
    messageEntityState: EntityState(),
    userSearchEntityState: EntityState(),
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
  Iterable<MessageState> selectUserMessages(int userId)
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
  
  Iterable<UserState> selectUserConversations(int userId)
    => userEntityState
        .getValue(userId)!.conversations.values
        .map((id) => userEntityState.getValue(id.id)!);

  //Select questions
  Iterable<QuestionState> get selectHomePageQuestions
    => homePageQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectExamQuestions(int examId)
    => examEntityState.getValue(examId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectSubjectQuestions(int subjectId)
    => subjectEntityState.getValue(subjectId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectTopicQuestions(int topicId)
    => topicEntityState.getValue(topicId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserQuestions(int userId)
    => userEntityState.getValue(userId)!.questions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserSolvedQuestions(int userId)
    => userEntityState.getValue(userId)!.solvedQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> selectUserUnsolvedQuestions(int userId)
    => userEntityState.getValue(userId)!.unsolvedQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  
  Iterable<QuestionState> get selectSearchQuestions
    => searchQuestions.values.map((e) => questionEntityState.getValue(e.id)!);
  Iterable<QuestionState> get selectSavedQuestions
    => questionUserSaves.values.map((e) => questionEntityState.getValue(e.questionId)!);

  QuestionState? selectQuestion(int questionId) => questionEntityState.getValue(questionId);


  //SelectSolutions
  Iterable<SolutionState> selectQuestionSolutions(int questionId)
    => questionEntityState.getValue(questionId)!.solutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionCorrectSolutions(int questionId)
    => questionEntityState.getValue(questionId)!.correctSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionPendingSolutions(int questionId)
    => questionEntityState.getValue(questionId)!.pendingSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionIncorrectSolutions(int questionId)
    => questionEntityState.getValue(questionId)!.incorrectSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> selectQuestionVideoSolutions(int questionId) =>
    questionEntityState.getValue(questionId)!.videoSolutions.values.map((e) => solutionEntityState.getValue(e.id)!);
  Iterable<SolutionState> get selectSavedSolutions
    => solutionUserSaves.values.map((e) => solutionEntityState.getValue(e.solutionId)!);


  //Select comments
  Iterable<CommentState> getQuestionComments(int questionId)
    => questionEntityState.getValue(questionId)!.comments.values.map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getFormatedQuestionComments(int id,int questionId)
    => questionEntityState.getValue(questionId)!.comments.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getSolutionComments(int solutionId)
    => solutionEntityState.getValue(solutionId)!.comments.values.map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> getFormatedSolutionComments(int id,int solutionId)
    => solutionEntityState.getValue(solutionId)!.comments.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);
  Iterable<CommentState> selectCommentReplies(int commentId)
    => commentEntityState.getValue(commentId)!.replies.values.map((e) => commentEntityState.getValue(e.id)!).toList().reversed;
  Iterable<CommentState> selectFormattedCommentReplies(int id,int commentId)
    => commentEntityState.getValue(commentId)!.replies.merge(Id(id: id)).map((e) => commentEntityState.getValue(e.id)!);

  //select exams
  Iterable<ExamState> get selectExams => appExams.values.map((e) => examEntityState.getValue(e.id)!);

  //Select Subjects
  Iterable<SubjectState> selectExamSubjects(int examId)
    => examEntityState.getValue(examId)!.subjects.values.map((e) => subjectEntityState.getValue(e.id)!);

  // select topics
  Iterable<TopicState> selectSubjectTopics(int subjectId)
    => subjectEntityState.getValue(subjectId)!.topics.values.map((e) => topicEntityState.getValue(e.id)!);

  //select privacy policy
  String? get selectPrivacyPolicy => policyState.privacyPolicies[loginState?.language];
  //select terms of use
  String? get selectTermsOfUse => policyState.termOfUses[loginState?.language];

  //select video questions
  Iterable<QuestionState> get selectVideoQuestions => 
    videoQuestions.values.map((id) => questionEntityState.getValue(id.id)!);
}