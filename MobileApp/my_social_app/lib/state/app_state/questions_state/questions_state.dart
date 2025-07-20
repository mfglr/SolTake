import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class QuestionsState{
  final EntityState<int, QuestionState> questions;
  final KeyPagination<int> homePageQuestions;
  final KeyPagination<int> savedQuestions;

  final Pagination<int,QuestionState> searchPageQuestions;
  final Pagination<int,QuestionState> videoQuestions;
  final Map<int,Pagination<int,QuestionState>> userQuestions;
  final Map<int,Pagination<int,QuestionState>> userSolvedQuestions;
  final Map<int,Pagination<int,QuestionState>> userUnsolvedQuestions;
  final Map<int,Pagination<int,QuestionState>> examQuestions;
  final Map<int,Pagination<int,QuestionState>> subjectQuestions;
  final Map<int,Pagination<int,QuestionState>> topicQuestions;
  final Map<int, Pagination<int, QuestionUserLikeState>> questionUserLikes;

  const QuestionsState({
    required this.questions,
    required this.userQuestions,
    required this.userSolvedQuestions,
    required this.userUnsolvedQuestions,
    required this.examQuestions,
    required this.subjectQuestions,
    required this.topicQuestions,
    required this.searchPageQuestions,
    required this.homePageQuestions,
    required this.savedQuestions,
    required this.videoQuestions,
    required this.questionUserLikes
  });

  QuestionsState optional({
    EntityState<int,QuestionState>? newQuestions,
    KeyPagination<int>? newHomePageQuestions,
    KeyPagination<int>? newSavedQuestions,

    Pagination<int,QuestionState>? newSearchPageQuestions,
    Pagination<int,QuestionState>? newVideoQuestions,
    Map<int,Pagination<int,QuestionState>>? newUserQuestions,
    Map<int,Pagination<int,QuestionState>>? newUserSolvedQuestions,
    Map<int,Pagination<int,QuestionState>>? newUserUnsolvedQuestions,
    Map<int,Pagination<int,QuestionState>>? newExamQuestions,
    Map<int,Pagination<int,QuestionState>>? newSubjectQuestions,
    Map<int,Pagination<int,QuestionState>>? newTopicQuestions,
    Map<int, Pagination<int, QuestionUserLikeState>>? newQuestionUserLikes,
  })
    =>
    QuestionsState(
      questions: newQuestions ?? questions,
      homePageQuestions: newHomePageQuestions ?? homePageQuestions,
      searchPageQuestions: newSearchPageQuestions ?? searchPageQuestions,
      savedQuestions: newSavedQuestions ?? savedQuestions,
      userQuestions: newUserQuestions ?? userQuestions,
      videoQuestions: newVideoQuestions ?? videoQuestions,
      userSolvedQuestions: newUserSolvedQuestions ?? userSolvedQuestions,
      userUnsolvedQuestions:  newUserUnsolvedQuestions ?? userUnsolvedQuestions,
      examQuestions: newExamQuestions ?? examQuestions,
      subjectQuestions: newSubjectQuestions ?? subjectQuestions,
      topicQuestions: newTopicQuestions ?? topicQuestions,
      questionUserLikes: newQuestionUserLikes ?? questionUserLikes,
    );

  //solutions
  QuestionsState createSolution(SolutionState solution) => 
    optional(newQuestions: questions.setOne(questions[solution.questionId]?.createSolution(solution)));
  QuestionsState deleteSolution(SolutionState solution) =>
    optional(newQuestions: questions.setOne(questions[solution.questionId]?.deleteSolution(solution)));
  //solutions

  QuestionsState like(QuestionState question, QuestionUserLikeState questionUserLike) =>
    optional(
      newQuestions: questions.setOne(question.like()),
      newQuestionUserLikes:
        questionUserLikes.updateElsePrependOne(
          question.id,
          (questionUserLikes[question.id] ?? Pagination.init(questionUserLikesPerPage, true)).prependOne(questionUserLike)
        )
    );
  QuestionsState dislike(QuestionState question, int userId) =>
    optional(
      newQuestions: questions.setOne(question.dislike()),
      newQuestionUserLikes:
        questionUserLikes.updateElsePrependOne(
          question.id,
          (questionUserLikes[question.id] ?? Pagination.init(questionUserLikesPerPage, true)).where((e) => e.userId != userId)
        )
    );
  QuestionsState increaseNumberOfComments(QuestionState question) => 
    optional(newQuestions: questions.setOne(question.increaseNumberOfComments()));


  //home page questions
  QuestionsState startLoadingNextHomePageQuestions() =>
    optional(newHomePageQuestions: homePageQuestions.startLoadingNext());
  QuestionsState addNextPageHomePageQuestions(Iterable<QuestionState> questions) =>
    optional(
      newQuestions: this.questions.setMany(questions),
      newHomePageQuestions: homePageQuestions.addNextPage(questions.map((e) => e.id))
    );
  QuestionsState refreshHomePageQuestions(Iterable<QuestionState> questions) =>
    optional(
      newQuestions: this.questions.setMany(questions),
      newHomePageQuestions: homePageQuestions.refreshPage(questions.map((e) => e.id))
    );
  QuestionsState stopLoadingNextHomePageQuestions() =>
    optional(newHomePageQuestions: homePageQuestions.stopLoadingNext());
  //home page questions

  //saved questions
  QuestionsState startLoadingNextSavedQuestions() =>
    optional(newSavedQuestions: savedQuestions.startLoadingNext());
  QuestionsState addNextPageSavedQuestions(Iterable<QuestionState> questions) =>
    optional(
      newQuestions: this.questions.setMany(questions),
      newSavedQuestions: savedQuestions.addNextPage(questions.map((e) => e.id))
    );
  QuestionsState refreshSavedQuestions(Iterable<QuestionState> questions) =>
    optional(
      newQuestions: this.questions.setMany(questions),
      newSavedQuestions: savedQuestions.refreshPage(questions.map((e) => e.id))
    );
  QuestionsState stopLoadingNextSavedQuestions() =>
    optional(newSavedQuestions: savedQuestions.stopLoadingNext());
  //saved questions;
}