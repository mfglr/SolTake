import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';

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
  QuestionsState load(int id) =>
    _optional(newQuestions: questions.load(id));
  QuestionsState loadSuccess(QuestionState question) =>
    _optional(newQuestions: questions.loadSuccess(question.id, question));
  QuestionsState failed(int id) =>
    _optional(newQuestions: questions.loadFailed(id));
  QuestionsState notFound(int id) =>
    _optional(newQuestions: questions.notFound(id));
  
  QuestionsState upload(QuestionState question) =>
    _optional(
      newQuestions: questions.upload(question.id, question),
      newUserQuestions: userQuestions.setOne(
        question.userId,
        _selectUserQuestionKeyPagination(question.userId).addOne(question.id)
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        _selectUserUnsolvedQuestionKeyPagination(question.userId).addOne(question.id)
      ),
    );
   QuestionsState reupload(QuestionState question) =>
    _optional(newQuestions: questions.upload(question.id, question));
  QuestionsState changeRate(int questionId, double rate) =>
    _optional(newQuestions: questions.changeRate(questionId, rate));
  QuestionsState processing(int questionId) =>
    _optional(newQuestions: questions.processing(questionId));
  QuestionsState uploadSuccess(QuestionState question, int serverId, Iterable<Media> medias) =>
    _optional(
      newQuestions: questions.loadSuccess(serverId, question.uploadSuccess(serverId, medias)).remove(question.id),
      newUserQuestions: userQuestions.setOne(
        question.userId,
        _selectUserQuestionKeyPagination(question.userId).addOne(serverId).removeOne(question.id),
      ),
      newUserUnsolvedQuestions: userQuestions.setOne(
        question.userId,
        _selectUserUnsolvedQuestionKeyPagination(question.userId).addOne(serverId).removeOne(question.id)
      )
    );
  QuestionsState uploadFailed(int questionId) =>
    _optional(newQuestions: questions.uploadFailed(questionId));

  QuestionsState delete(QuestionState question) =>
    _optional(
      newQuestions:
        questions.delete(question.id),
      newUserQuestions:
        userQuestions.setOne(question.userId,  userQuestions[question.userId]?.removeOne(question.id)),
      newUserSolvedQuestions:
        userSolvedQuestions.setOne(question.userId,  userSolvedQuestions[question.userId]?.removeOne(question.id)),
      newUserUnsolvedQuestions:
        userUnsolvedQuestions.setOne(question.userId,  userUnsolvedQuestions[question.userId]?.removeOne(question.id)),
    );
  QuestionsState like(QuestionState question) =>
    _optional(newQuestions: questions.update(question.id, question.like()));
  QuestionsState dislike(QuestionState question) =>
    _optional(newQuestions: questions.update(question.id, question.dislike()));
  //questions

  //solutions
  QuestionsState createSolution(SolutionState solution) =>
    _optional(
      newQuestions: questions.update(
        solution.questionId,
        questions[solution.questionId].entity?.createSolution(solution)
      )
    );
  QuestionsState markSolutionAsCorrect(SolutionState solution) =>
    _optional(
      newQuestions: questions.update(
        solution.questionId,
        questions[solution.questionId].entity?.markSolutionAsCorrect(solution)
      )
    );
  QuestionsState deleteSolution(SolutionState solution) =>
    _optional(
      newQuestions: questions.update(
        solution.questionId,
        questions[solution.questionId].entity?.deleteSolution(solution)
      )
    );
  //solutions

  //home questions
  QuestionsState startNextHomeQuestions() => 
    _optional(newHomeQuestions: homeQuestions.startNext());
  QuestionsState addNextHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshHomeQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextHomeQuestions() => 
    _optional(newHomeQuestions: homeQuestions.stopNext());
  ContainerPagination<int, QuestionState> selectHomeQuestions() =>
    ContainerPagination<int, QuestionState>.fromCollection(questions, homeQuestions);
  //home questions

  //search questions
  QuestionsState startNextSearchQuestions() => 
    _optional(newSearchQuestions: searchQuestions.startNext());
  QuestionsState addNextSearchQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshSearchQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextSearchQuestions() => 
    _optional(newSearchQuestions: searchQuestions.stopNext());
  ContainerPagination<int, QuestionState> selectSearchPageQuestions() =>
    ContainerPagination<int, QuestionState>.fromCollection(questions, searchQuestions);
  //search questions

  //video questions
  QuestionsState startNextVideoQuestions() => 
    _optional(newVideoQuestions: videoQuestions.startNext());
  QuestionsState addNextVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextVideoQuestions() => 
    _optional(newVideoQuestions: videoQuestions.stopNext());
  ContainerPagination<int, QuestionState> selectVideoQuestions() =>
    ContainerPagination<int, QuestionState>.fromCollection(questions, videoQuestions);
  //video questions

  //user questions
  KeyPagination<int> _selectUserQuestionKeyPagination(int userId) =>
    userQuestions[userId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        _selectUserQuestionKeyPagination(userId).startNext()
      ),
    );
  QuestionsState addNextUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserQuestions: userQuestions.setOne(
        userId,
        _selectUserQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserQuestions: userQuestions.setOne(
        userId,
        _selectUserQuestionKeyPagination(userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        _selectUserQuestionKeyPagination(userId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectUserQuestions(int userId) =>
    ContainerPagination<int, QuestionState>.fromCollection(questions,_selectUserQuestionKeyPagination(userId));
  //user questions  
  
  //user solved questions
  KeyPagination<int> _selectUserSolvedQuestionKeyPagination(int userId) =>
    userSolvedQuestions[userId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        _selectUserSolvedQuestionKeyPagination(userId).startNext()
      ),
    );
  QuestionsState addNextUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        _selectUserSolvedQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        _selectUserSolvedQuestionKeyPagination(userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        _selectUserSolvedQuestionKeyPagination(userId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectUserSolvedQuestions(int userId) =>
    ContainerPagination<int, QuestionState>.fromCollection(questions,_selectUserSolvedQuestionKeyPagination(userId));
  //user solved questions

  //user unsolved questions
  KeyPagination<int> _selectUserUnsolvedQuestionKeyPagination(int userId) =>
    userUnsolvedQuestions[userId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        _selectUserUnsolvedQuestionKeyPagination(userId).startNext()
      ),
    );
  QuestionsState addNextUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        _selectUserUnsolvedQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        _selectUserUnsolvedQuestionKeyPagination(userId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        _selectUserUnsolvedQuestionKeyPagination(userId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectUserUnsolvedQuestions(int userId) =>
    ContainerPagination<int, QuestionState>.fromCollection(questions,_selectUserUnsolvedQuestionKeyPagination(userId));
  //user unsolved questions

  //exam questions
  KeyPagination<int> _selectExamQuestionKeyPagination(int examId) =>
    examQuestions[examId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextExamQuestions(int examId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        _selectExamQuestionKeyPagination(examId).startNext()
      ),
    );
  QuestionsState addNextExamQuestions(int examId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newExamQuestions: examQuestions.setOne(
        examId,
        _selectExamQuestionKeyPagination(examId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshExamQuestions(int examId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newExamQuestions: examQuestions.setOne(
        examId,
        _selectExamQuestionKeyPagination(examId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextExamQuestions(int examId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        _selectExamQuestionKeyPagination(examId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectExamQuestions(int examId) =>
    ContainerPagination<int, QuestionState>.fromCollection(questions, _selectExamQuestionKeyPagination(examId));
  //exam questions

  //subject questions
  KeyPagination<int> _selectSubjectQuestionKeyPagination(int subjectId) =>
    subjectQuestions[subjectId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        _selectSubjectQuestionKeyPagination(subjectId).startNext()
      ),
    );
  QuestionsState addNextSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        _selectSubjectQuestionKeyPagination(subjectId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        _selectSubjectQuestionKeyPagination(subjectId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        _selectSubjectQuestionKeyPagination(subjectId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectSubjectQuestions(int subjectId) =>
    ContainerPagination<int, QuestionState>.fromCollection(
      questions,
      _selectSubjectQuestionKeyPagination(subjectId)
    );
  //subject questions

  //topic questions
  KeyPagination<int> _selectTopicQuestionKeyPagination(int topicId) =>
    topicQuestions[topicId] ?? KeyPagination<int>.init(questionsPerPage, true);
  QuestionsState startNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        _selectTopicQuestionKeyPagination(topicId).startNext()
      ),
    );
  QuestionsState addNextTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        _selectTopicQuestionKeyPagination(topicId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newQuestions: this.questions.loadSuccessMany({ for (var e in questions) e.id : e }),
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        _selectTopicQuestionKeyPagination(topicId).refresh(questions.map((e) => e.id))
      ),
    );
  QuestionsState stopNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        _selectTopicQuestionKeyPagination(topicId).stopNext()
      ),
    );
  ContainerPagination<int, QuestionState> selectTopicQuestions(int topicId) =>
    ContainerPagination<int, QuestionState>.fromCollection(
      questions,
      _selectTopicQuestionKeyPagination(topicId)
    );
  //topic questions
}