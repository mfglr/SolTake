import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class QuestionsState{
  final Pagination<int,QuestionState> homePageQuestions;
  final Pagination<int,QuestionState> searchPageQuestions;
  final Pagination<int,QuestionState> savedQuestions;
  final Map<int,Pagination<int,QuestionState>> userQuestions;
  final Map<int,Pagination<int,QuestionState>> userSolvedQuestions;
  final Map<int,Pagination<int,QuestionState>> userUnsolvedQuestions;
  final Map<int,Pagination<int,QuestionState>> examQuestions;
  final Map<int,Pagination<int,QuestionState>> subjectQuestions;
  final Map<int,Pagination<int,QuestionState>> topicQuestions;
  final Map<int, Pagination<int, QuestionUserLikeState>> questionUserLikes;

  const QuestionsState({
    required this.userQuestions,
    required this.userSolvedQuestions,
    required this.userUnsolvedQuestions,
    required this.examQuestions,
    required this.subjectQuestions,
    required this.topicQuestions,
    required this.searchPageQuestions,
    required this.homePageQuestions,
    required this.savedQuestions,
    required this.questionUserLikes
  });

  QuestionsState optional({
    Pagination<int,QuestionState>? newHomePageQuestions,
    Pagination<int,QuestionState>? newSearchPageQuestions,
    Pagination<int,QuestionState>? newSavedQuestions,
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
      homePageQuestions: newHomePageQuestions ?? homePageQuestions,
      searchPageQuestions: newSearchPageQuestions ?? searchPageQuestions,
      savedQuestions: newSavedQuestions ?? savedQuestions,
      userQuestions: newUserQuestions ?? userQuestions,
      userSolvedQuestions: newUserSolvedQuestions ?? userSolvedQuestions,
      userUnsolvedQuestions:  newUserUnsolvedQuestions ?? userUnsolvedQuestions,
      examQuestions: newExamQuestions ?? examQuestions,
      subjectQuestions: newSubjectQuestions ?? subjectQuestions,
      topicQuestions: newTopicQuestions ?? topicQuestions,
      questionUserLikes: newQuestionUserLikes ?? questionUserLikes,
    );

  QuestionsState like(QuestionState question, QuestionUserLikeState questionUserLike) =>
    QuestionsState(
      examQuestions:
        examQuestions[question.exam.id] != null
          ? examQuestions.updateOne(
              question.exam.id,
              examQuestions[question.exam.id]!.updateOne(question.like())
            )
          : examQuestions,
        subjectQuestions: subjectQuestions[question.subject.id] != null
          ? subjectQuestions.updateOne(
              question.subject.id,
              subjectQuestions[question.subject.id]!.updateOne(question.like())
            )
          : subjectQuestions,
        topicQuestions: 
          question.topic?.id != null && topicQuestions[question.topic?.id] != null
            ? topicQuestions.updateOne(
                question.topic!.id,
                topicQuestions[question.topic!.id]!.updateOne(question.like())
              )
            : topicQuestions,
        userQuestions: userQuestions[question.userId] != null
          ? userQuestions.updateOne(
              question.userId,
              userQuestions[question.userId]!.updateOne(question.like())
            )
          : userQuestions,
        userSolvedQuestions: userSolvedQuestions[question.userId] != null
          ? userSolvedQuestions.updateOne(
              question.userId,
              userSolvedQuestions[question.userId]!.updateOne(question.like())
            )
          : userSolvedQuestions,
        userUnsolvedQuestions: userUnsolvedQuestions[question.userId] != null
          ? userUnsolvedQuestions.updateOne(
              question.userId,
              userUnsolvedQuestions[question.userId]!.updateOne(question.like()) 
            )
          : userUnsolvedQuestions,
        homePageQuestions: homePageQuestions.updateOne(question.like()),
        savedQuestions: savedQuestions.updateOne(question.like()),
        searchPageQuestions: searchPageQuestions.updateOne(question.like()),

        questionUserLikes:
          questionUserLikes.updateElsePrependOne(
            question.id,
            (questionUserLikes[question.id] ?? Pagination.init(questionUserLikesPerPage, true)).prependOne(questionUserLike)
          )
    );
  QuestionsState dislike(QuestionState question, int userId) =>
    QuestionsState(
      examQuestions:
        examQuestions[question.exam.id] != null
          ? examQuestions.updateOne(
              question.exam.id,
              examQuestions[question.exam.id]!.updateOne(question.dislike())
            )
          : examQuestions,
        subjectQuestions: subjectQuestions[question.subject.id] != null
          ? subjectQuestions.updateOne(
              question.subject.id,
              subjectQuestions[question.subject.id]!.updateOne(question.dislike())
            )
          : subjectQuestions,
        topicQuestions: 
          question.topic?.id != null && topicQuestions[question.topic?.id] != null
            ? topicQuestions.updateOne(
                question.topic!.id,
                topicQuestions[question.topic!.id]!.updateOne(question.dislike())
              )
            : topicQuestions,
        userQuestions: userQuestions[question.userId] != null
          ? userQuestions.updateOne(
              question.userId,
              userQuestions[question.userId]!.updateOne(question.dislike())
            )
          : userQuestions,
        userSolvedQuestions: userSolvedQuestions[question.userId] != null
          ? userSolvedQuestions.updateOne(
              question.userId,
              userSolvedQuestions[question.userId]!.updateOne(question.dislike())
            )
          : userSolvedQuestions,
        userUnsolvedQuestions: userUnsolvedQuestions[question.userId] != null
          ? userUnsolvedQuestions.updateOne(
              question.userId,
              userUnsolvedQuestions[question.userId]!.updateOne(question.dislike()) 
            )
          : userUnsolvedQuestions,
        homePageQuestions: homePageQuestions.updateOne(question.dislike()),
        savedQuestions: savedQuestions.updateOne(question.dislike()),
        searchPageQuestions: searchPageQuestions.updateOne(question.dislike()),
        questionUserLikes:
          questionUserLikes[question.id] != null
            ? questionUserLikes.updateOne(
                question.id,
                questionUserLikes[question.id]!.where((e) => e.userId != userId)
              )
            : questionUserLikes
    );
  QuestionsState increaseNumberOfComments(QuestionState question) => 
    QuestionsState(
      examQuestions:
        examQuestions[question.exam.id] != null
          ? examQuestions.updateOne(
              question.exam.id,
              examQuestions[question.exam.id]!.updateOne(question.increaseNumberOfComments())
            )
          : examQuestions,
        subjectQuestions: subjectQuestions[question.subject.id] != null
          ? subjectQuestions.updateOne(
              question.subject.id,
              subjectQuestions[question.subject.id]!.updateOne(question.increaseNumberOfComments())
            )
          : subjectQuestions,
        topicQuestions: 
          question.topic?.id != null && topicQuestions[question.topic?.id] != null
            ? topicQuestions.updateOne(
                question.topic!.id,
                topicQuestions[question.topic!.id]!.updateOne(question.increaseNumberOfComments())
              )
            : topicQuestions,
        userQuestions: userQuestions[question.userId] != null
          ? userQuestions.updateOne(
              question.userId,
              userQuestions[question.userId]!.updateOne(question.increaseNumberOfComments())
            )
          : userQuestions,
        userSolvedQuestions: userSolvedQuestions[question.userId] != null
          ? userSolvedQuestions.updateOne(
              question.userId,
              userSolvedQuestions[question.userId]!.updateOne(question.increaseNumberOfComments())
            )
          : userSolvedQuestions,
        userUnsolvedQuestions: userUnsolvedQuestions[question.userId] != null
          ? userUnsolvedQuestions.updateOne(
              question.userId,
              userUnsolvedQuestions[question.userId]!.updateOne(question.increaseNumberOfComments()) 
            )
          : userUnsolvedQuestions,
        homePageQuestions: homePageQuestions.updateOne(question.increaseNumberOfComments()),
        savedQuestions: savedQuestions.updateOne(question.increaseNumberOfComments()),
        searchPageQuestions: searchPageQuestions.updateOne(question.increaseNumberOfComments()),
        questionUserLikes: questionUserLikes
    );
}