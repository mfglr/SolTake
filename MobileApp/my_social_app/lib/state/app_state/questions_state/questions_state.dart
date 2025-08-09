import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';

@immutable
class QuestionsState {
  final EntityCollection<int, QuestionState> questions;
  
  final KeyPagination<int> homeQuestions;
  final KeyPagination<int> searchQuestions;
  final KeyPagination<int> videoQuestions;
  
  final Map<int, KeyPagination<int>> userQuestions;
  final Map<int, KeyPagination<int>> userSolvedQuestions;
  final Map<int, KeyPagination<int>> userUnsolvedQuestions;

  final Map<int, KeyPagination<int>> examQuestions;
  final Map<int, KeyPagination<int>> subjectQuestions;
  final Map<int, KeyPagination<int>> topicQuestions;

  const QuestionsState({
    required this.questions,

    required this.homeQuestions,
    required this.searchQuestions,
    required this.videoQuestions,
    
    required this.userQuestions,
    required this.userSolvedQuestions,
    required this.userUnsolvedQuestions,
    
    required this.examQuestions,
    required this.subjectQuestions,
    required this.topicQuestions,
  });

  QuestionsState _optional({
    EntityCollection<int, QuestionState>? newQuestions,
    
    KeyPagination<int>? newHomeQuestions,
    KeyPagination<int>? newSearchQuestions,
    KeyPagination<int>? newVideoQuestions,

    Map<int, KeyPagination<int>>? newUserQuestions,
    Map<int, KeyPagination<int>>? newUserSolvedQuestions,
    Map<int, KeyPagination<int>>? newUserUnsolvedQuestions,

    Map<int, KeyPagination<int>>? newExamQuestions,
    Map<int, KeyPagination<int>>? newSubjectQuestions,
    Map<int, KeyPagination<int>>? newTopicQuestions,

  }) => 
    QuestionsState(
      questions: newQuestions ?? questions,

      homeQuestions: newHomeQuestions ?? homeQuestions,
      searchQuestions: newSearchQuestions ?? searchQuestions,
      videoQuestions: newVideoQuestions ?? videoQuestions,
      
      userQuestions: newUserQuestions ?? userQuestions,
      userSolvedQuestions: newUserSolvedQuestions ?? userSolvedQuestions,
      userUnsolvedQuestions: newUserUnsolvedQuestions ?? userUnsolvedQuestions,

      examQuestions: newExamQuestions ?? examQuestions,
      subjectQuestions: newSubjectQuestions ?? subjectQuestions,
      topicQuestions: newTopicQuestions ?? topicQuestions,
    );

  //questions
  QuestionsState loading(int id) => _optional(newQuestions: questions.loading(id));
  QuestionsState success(QuestionState question) => _optional(newQuestions: questions.success(question.id, question));
  QuestionsState failed(int id) => _optional(newQuestions: questions.failed(id));
  QuestionsState notFound(int id) => _optional(newQuestions: questions.notFound(id));
  QuestionsState create(QuestionState question) =>
    _optional(
      newQuestions: questions.successOne(question.id, question),
      newUserQuestions: userQuestions.setOne(
        question.userId,
        selectUserQuestionPaginationFromState(this,question.userId).addOne(question.id)
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        selectUserUnsolvedQuestionPaginationFromState(this, question.userId).addOne(question.id)
      ),
    );
  QuestionsState delete(QuestionState question) =>
    _optional(
      newQuestions:
        questions.notFound(question.id),
      newUserQuestions:
        userQuestions.setOne(question.userId,  userQuestions[question.userId]?.removeOne(question.id)),
      newUserSolvedQuestions:
        userSolvedQuestions.setOne(question.userId,  userSolvedQuestions[question.userId]?.removeOne(question.id)),
      newUserUnsolvedQuestions:
        userUnsolvedQuestions.setOne(question.userId,  userUnsolvedQuestions[question.userId]?.removeOne(question.id)),
    );
  QuestionsState like(QuestionState question) =>
    _optional(
      newQuestions: questions.successOne(question.id, question.like())
    );
  QuestionsState dislike(QuestionState question) =>
    _optional(
      newQuestions: questions.successOne(question.id, question.dislike())
    );
  //questions

  //solutions
  QuestionsState createSolution(SolutionState solution) =>
    _optional(
      newQuestions: questions.updateOne(
        solution.questionId,
        questions[solution.questionId].entity?.createSolution(solution)
      )
    );
  QuestionsState deleteSolution(SolutionState solution) =>
    _optional(
      newQuestions: questions.updateOne(
        solution.questionId,
        questions[solution.questionId].entity?.deleteSolution(solution)
      )
    );
  //solutions


  //home questions
  QuestionsState startNextHomeQuestions() => 
    _optional(
      newHomeQuestions: homeQuestions.startNext(),
    );
  QuestionsState addNextHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextHomeQuestions() => 
    _optional(
      newHomeQuestions: homeQuestions.stopNext(),
    );
  //home questions

  //search questions
  QuestionsState startNextSearchQuestions() => 
    _optional(
      newSearchQuestions: searchQuestions.startNext(),
    );
  QuestionsState addNextSearchQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshSearchQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextSearchQuestions() => 
    _optional(
      newSearchQuestions: searchQuestions.stopNext(),
    );
  //search questions

  //video questions
  QuestionsState startNextVideoQuestions() => 
    _optional(
      newVideoQuestions: videoQuestions.startNext(),
    );
  QuestionsState addNextVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextVideoQuestions() => 
    _optional(
      newVideoQuestions: videoQuestions.stopNext(),
    );
  //video questions

  //user questions
  QuestionsState startNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).startNext()
      ),
    );
  QuestionsState addNextUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionPaginationFromState(this, userId).stopNext()
      ),
    );
  //user questions  
  
  //user solved questions
  QuestionsState startNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        selectUserSolvedQuestionPaginationFromState(this, userId).startNext()
      ),
    );
  QuestionsState addNextUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        selectUserSolvedQuestionPaginationFromState(this, userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        selectUserSolvedQuestionPaginationFromState(this, userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        selectUserSolvedQuestionPaginationFromState(this, userId).stopNext()
      ),
    );
  //user solved questions

  //user unsolved questions
  QuestionsState startNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        selectUserUnsolvedQuestionPaginationFromState(this, userId).startNext()
      ),
    );
  QuestionsState addNextUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        selectUserUnsolvedQuestionPaginationFromState(this, userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        selectUserUnsolvedQuestionPaginationFromState(this, userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        selectUserUnsolvedQuestionPaginationFromState(this, userId).stopNext()
      ),
    );
  //user unsolved questions

  //exam questions
  QuestionsState startNextExamQuestions(int userId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        userId,
        selectExamQuestionPaginationFromState(this, userId).startNext()
      ),
    );
  QuestionsState addNextExamQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newExamQuestions: examQuestions.setOne(
        userId,
        selectExamQuestionPaginationFromState(this, userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshExamQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newExamQuestions: examQuestions.setOne(
        userId,
        selectExamQuestionPaginationFromState(this, userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextExamQuestions(int userId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        userId,
        selectExamQuestionPaginationFromState(this, userId).stopNext()
      ),
    );
  //exam questions

  //subject questions
  QuestionsState startNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionPaginationFromState(this, subjectId).startNext()
      ),
    );
  QuestionsState addNextSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionPaginationFromState(this, subjectId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionPaginationFromState(this, subjectId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionPaginationFromState(this, subjectId).stopNext()
      ),
    );
  //subject questions

  //subject questions
  QuestionsState startNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionPaginationFromState(this, topicId).startNext()
      ),
    );
  QuestionsState addNextTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionPaginationFromState(this, topicId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.successMany({ for (var e in questions) e.id : e }),
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionPaginationFromState(this, topicId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionPaginationFromState(this, topicId).stopNext()
      ),
    );
  //subject questions
  
}