import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/new_entity_collection.dart';

@immutable
class NewQuestionsState {
  final NewEntityCollection<int, QuestionState> questions;
  final KeyPagination<int> homeQuestions;
  final KeyPagination<int> searchQuestions;
  final KeyPagination<int> videoQuestions;
  final Map<int, KeyPagination<int>> userQuestions;
  final Map<int, KeyPagination<int>> userSolvedQuestions;
  final Map<int, KeyPagination<int>> userUnsolvedQuestions;

  const NewQuestionsState({
    required this.questions,
    required this.homeQuestions,
    required this.searchQuestions,
    required this.videoQuestions,
    required this.userQuestions,
    required this.userSolvedQuestions,
    required this.userUnsolvedQuestions,
  });

  NewQuestionsState _optional({
    NewEntityCollection<int, QuestionState>? newQuestions,
    KeyPagination<int>? newHomeQuestions,
    KeyPagination<int>? newSearchQuestions,
    KeyPagination<int>? newVideoQuestions,
    Map<int, KeyPagination<int>>? newUserQuestions,
    Map<int, KeyPagination<int>>? newUserSolvedQuestions,
    Map<int, KeyPagination<int>>? newUserUnsolvedQuestions
  }) => 
    NewQuestionsState(
      questions: newQuestions ?? questions,
      homeQuestions: newHomeQuestions ?? homeQuestions,
      searchQuestions: newSearchQuestions ?? searchQuestions,
      videoQuestions: newVideoQuestions ?? videoQuestions,
      userQuestions: newUserQuestions ?? userQuestions,
      userSolvedQuestions: newUserSolvedQuestions ?? userSolvedQuestions,
      userUnsolvedQuestions: newUserUnsolvedQuestions ?? userUnsolvedQuestions
    );

  NewQuestionsState create(QuestionState question) =>
    _optional(
      newQuestions: questions.setOne(question),
      newUserQuestions: userQuestions.setOne(
        question.userId,
        selectUserQuestionPaginationFromState(this,question.userId).addOne(question.id)
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        selectUserUnsolvedQuestionPaginationFromState(this, question.userId)
      ),
    );

  //home questions
  NewQuestionsState startNextHomeQuestions() => 
    _optional(
      newHomeQuestions: homeQuestions.startNext(),
    );
  NewQuestionsState addNextHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newHomeQuestions: homeQuestions.addNext(questions.map((e) => e.id))
    );
  NewQuestionsState refreshHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newHomeQuestions: homeQuestions.refresh(questions.map((e) => e.id))
    );
  NewQuestionsState stopNextHomeQuestions() => 
    _optional(
      newHomeQuestions: homeQuestions.stopNext(),
    );
  //home questions

  //video questions
  NewQuestionsState startNextVideoQuestions() => 
    _optional(
      newVideoQuestions: videoQuestions.startNext(),
    );
  NewQuestionsState addNextVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newVideoQuestions: videoQuestions.addNext(questions.map((e) => e.id))
    );
  NewQuestionsState refreshVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newVideoQuestions: videoQuestions.refresh(questions.map((e) => e.id))
    );
  NewQuestionsState stopNextVideoQuestions() => 
    _optional(
      newVideoQuestions: videoQuestions.stopNext(),
    );
  //video questions

  //user questions
  NewQuestionsState startNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).startNext()
      ),
    );
  NewQuestionsState addNextUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).addNext(questions.map((e) => e.id))
      ),
    );
  NewQuestionsState refreshUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.setMany(questions),
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).refresh(questions.map((e) => e.id))
      ),
    );
  NewQuestionsState stopNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).stopNext()
      ),
    );
  //user questions  
  
}