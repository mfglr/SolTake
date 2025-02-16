import 'package:flutter/foundation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/create_comment_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_entity_state.dart';
import 'package:my_social_app/state/app_state/home_page_state/home_page_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_entity_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/message_home_page_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_entity_state.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_entity_state.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_entity_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_entity_state.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_entity_state.dart';
import 'package:my_social_app/state/pagination/entity_pagination.dart';
import 'package:my_social_app/state/pagination/pagination.dart';


@immutable
class AppState{
  final bool isInitialized;
  final ActiveAccountPage activeAccountPage;
  final String? accessToken;
  final LoginState? loginState;
  final UserEntityState userEntityState;
  final FollowEntityState followEntityState;
  final SearchState searchState;
  final ExamEntityState examEntityState;
  final SubjectEntityState subjectEntityState;
  final TopicEntityState topicEntityState;
  final SolutionEntityState solutionEntityState;
  final SolutionUserVoteEntityState solutionUserVoteEntityState;
  final SolutionUserSaveEntityState solutionUserSaveEntityState;
  final HomePageState homePageState;
  final CommentEntityState commentEntityState;
  final CommentUserLikeEntityState commentUserLikeEntityState;
  final CreateCommentState createCommentState;
  final NotificationEntityState notificationEntityState;
  final MessageEntityState messageEntityState;
  final MessageHomePageState messageHomePageState;
  final UserSearchEntityState userSearchEntityState;
  final QuestionEntityState questionEntityState;
  final QuestionUserLikeEntityState questionUserLikeEntityState;
  final QuestionUserSaveEntityState questionUserSaveEntityState;
  final Pagination exams;
  final PolicyState policyState;
  final Pagination videoQuestions;
  final UploadEntityState uploadEntityState;

  const AppState({
    required this.activeAccountPage,
    required this.accessToken,
    required this.loginState,
    required this.isInitialized,
    required this.userEntityState,
    required this.searchState,
    required this.examEntityState,
    required this.subjectEntityState,
    required this.topicEntityState,
    required this.solutionEntityState,
    required this.solutionUserVoteEntityState,
    required this.solutionUserSaveEntityState,
    required this.homePageState,
    required this.commentEntityState,
    required this.commentUserLikeEntityState,
    required this.createCommentState,
    required this.notificationEntityState,
    required this.messageEntityState,
    required this.messageHomePageState,
    required this.userSearchEntityState,
    required this.followEntityState,
    required this.questionEntityState,
    required this.questionUserLikeEntityState,
    required this.questionUserSaveEntityState,
    required this.exams,
    required this.policyState,
    required this.videoQuestions,
    required this.uploadEntityState
  });

  AppState clear() => AppState(
    activeAccountPage: ActiveAccountPage.loginPage,
    accessToken: null,
    loginState: null,
    isInitialized: true,
    userEntityState: const UserEntityState(entities: {}),
    searchState: SearchState(
      key: "",examId: null,subjectId: null,topicId: null,
      questions: Pagination.init(questionsPerPage,true),
      users: Pagination.init(usersPerPage,true),
      searchedUsers: Pagination.init(usersPerPage,true)
    ),
    examEntityState: const ExamEntityState(entities: {}),
    subjectEntityState: const SubjectEntityState(entities: {}),
    topicEntityState: const TopicEntityState(entities: {}),
    solutionEntityState: const SolutionEntityState(entities: {}),
    homePageState: HomePageState(questions: Pagination.init(questionsPerPage,true)),
    commentEntityState: const CommentEntityState(entities: {}),
    commentUserLikeEntityState: const CommentUserLikeEntityState(entities: {}),
    createCommentState: const CreateCommentState(question: null, solution: null, comment: null, content: ""),
    notificationEntityState: NotificationEntityState(pagination: EntityPagination.init(notificationsPerPage, true)),
    messageEntityState: const MessageEntityState(entities: {}),
    messageHomePageState: MessageHomePageState(conversations: Pagination.init(conversationsPerPage,true)),
    userSearchEntityState: const UserSearchEntityState(entities: {}),
    followEntityState: const FollowEntityState(entities: {}),
    questionEntityState: const QuestionEntityState(entities: {}),
    questionUserLikeEntityState: const QuestionUserLikeEntityState(entities: {}),
    questionUserSaveEntityState: const QuestionUserSaveEntityState(entities: {}),
    solutionUserVoteEntityState: const SolutionUserVoteEntityState(entities: {}),
    solutionUserSaveEntityState: const SolutionUserSaveEntityState(entities: {}),
    exams: Pagination.init(examsPerPage, true),
    policyState: const PolicyState(privacyPolicies: {}, termOfUses: {}),
    videoQuestions: Pagination.init(questionsPerPage, true),
    uploadEntityState: UploadEntityState.init()
  );

  //select messages
  Iterable<MessageState> get selectConversations => messageEntityState.selectConversations;
  Iterable<MessageState> selectUserMessages(int userId)
    => userEntityState.entities[userId]!.messages.ids
      .map((e) => messageEntityState.entities[e]!);
  Iterable<int> get selectIdsOfNewComingMessages
    => messageEntityState.entities.values
        .where((e) => e.state == MessageStatus.created && e.senderId != loginState!.id)
        .map((e) => e.id);
  int get selectNumberOfComingMessages
    => messageEntityState.entities.values
        .where((e) => e.state != MessageStatus.viewed && e.senderId != loginState!.id)
        .length;

  //select users
  UserState? get currentUser => userEntityState.entities[loginState!.id];
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
      (e) => userEntityState.entities[questionUserLikeEntityState.entities[e]!.userId]!
    );
  Iterable<UserState> selectCommentLikes(int commentId)
    => commentEntityState.entities[commentId]!.likes.ids.map(
      (e) => userEntityState.entities[commentUserLikeEntityState.entities[e]!.userId]!
    );
  Iterable<UserState> selectSolutionUpvotes(int solutionId)
    => solutionEntityState.entities[solutionId]!.upvotes.ids.map(
      (voteId) => userEntityState.entities[solutionUserVoteEntityState.entities[voteId]!.userId]!
    );
  Iterable<UserState> selectSolutionDownvotes(int solutionId)
    => solutionEntityState.entities[solutionId]!.downvotes.ids.map(
      (voteId) => userEntityState.entities[solutionUserVoteEntityState.entities[voteId]!.userId]!
    );
  Iterable<UserState> selectUserConversations(int userId)
    => userEntityState.entities[userId]!.conversations.ids.map((id) => userEntityState.entities[id]!);

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
  Iterable<QuestionState> selectUserSavedQuestions(int userId) =>
    userEntityState.entities[userId]!.savedQuestions.ids.map(
      (saveId) => questionEntityState.entities[questionUserSaveEntityState.entities[saveId]!.questionId]!
    );
  Iterable<QuestionState> get selectSearchQuestions
    => searchState.questions.ids.map((e) => questionEntityState.entities[e]!);
  QuestionState? selectQuestion(int questionId) => questionEntityState.entities[questionId];


  //SelectSolutions
  Iterable<SolutionState> selectQuestionSolutions(int questionId)
    => questionEntityState.entities[questionId]!.solutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionCorrectSolutions(int questionId)
    => questionEntityState.entities[questionId]!.correctSolutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionPendingSolutions(int questionId)
    => questionEntityState.entities[questionId]!.pendingSolutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectQuestionIncorrectSolutions(int questionId)
    => questionEntityState.entities[questionId]!.incorrectSolutions.ids.map((e) => solutionEntityState.entities[e]!);
  Iterable<SolutionState> selectUserSavedSolutions(int userId) =>
    userEntityState.entities[userId]!.savedSolutions.ids.map(
      (saveId) => solutionEntityState.entities[solutionUserSaveEntityState.entities[saveId]!.solutionId]!
    );
  Iterable<SolutionState> selectQuestionVideoSolutions(int questionId) =>
    questionEntityState.entities[questionId]!.videoSolutions.ids.map((e) => solutionEntityState.entities[e]!);

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
    => commentEntityState.entities[commentId]!.replies.ids.map((e) => commentEntityState.entities[e]!).toList().reversed;
  Iterable<CommentState> selectFormattedCommentReplies(int id,int commentId)
    => commentEntityState.entities[commentId]!.replies.merge(id).map((e) => commentEntityState.entities[e]!);

  //select exams
  Iterable<ExamState> get selectExams => exams.ids.map((e) => examEntityState.entities[e]!);

  //Select Subjects
  Iterable<SubjectState> selectExamSubjects(int? examId)
    => examEntityState.entities[examId]?.subjects.ids.map((e) => subjectEntityState.entities[e]!) ?? [];

  // select topics
  Iterable<TopicState> selectSubjectTopics(int? subjectId)
    => subjectEntityState.entities[subjectId]?.topics.ids.map((e) => topicEntityState.entities[e]!) ?? [];

  //select privacy policy
  String? get selectPrivacyPolicy => policyState.privacyPolicies[loginState?.language];
  //select terms of use
  String? get selectTermsOfUse => policyState.termOfUses[loginState?.language];

  //select video questions
  Iterable<QuestionState> get selectVideoQuestions => videoQuestions.ids.map((id) => questionEntityState.entities[id]!);
}