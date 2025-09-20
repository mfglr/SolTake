import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_collection.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_collection.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';

@immutable
class QuestionsState {
  final UploadableCollection<String, QuestionState<String>> uploadableCollection;
  final LoadableCollection<int, QuestionState<int>> loadableCollection;
  
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
    required this.uploadableCollection,
    required this.loadableCollection,

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
    UploadableCollection<String, QuestionState<String>>? newUploadableCollection,
    LoadableCollection<int, QuestionState<int>>? newQuestions,
    
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
      uploadableCollection: newUploadableCollection ?? uploadableCollection,
      loadableCollection: newQuestions ?? loadableCollection,

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
    _optional(newQuestions: loadableCollection.loading(id));
  QuestionsState loadSuccess(QuestionState<int> question) =>
    _optional(newQuestions: loadableCollection.success(question.id, question));
  QuestionsState failed(int id) =>
    _optional(newQuestions: loadableCollection.failed(id));
  QuestionsState notFound(int id) =>
    _optional(newQuestions: loadableCollection.notFound(id));
  
  QuestionsState upload(QuestionState<String> question) =>
    _optional(newUploadableCollection: uploadableCollection.uploading(question.id, question));
  QuestionsState changeRate(String questionId, double rate) =>
    _optional(newUploadableCollection: uploadableCollection.changeRate(questionId, rate));
  QuestionsState processing(String questionId) =>
    _optional(newUploadableCollection: uploadableCollection.processing(questionId));
  QuestionsState uploadSuccess(QuestionState<String> question, int serverId) =>
    _optional(
      newQuestions: loadableCollection.success(serverId, question.changeId<int>(serverId)),
      newUserQuestions: userQuestions.setOne(question.userId, _selectUserQuestionKeyPagination(question.userId).addOne(serverId)),
      newUserUnsolvedQuestions: userQuestions.setOne(question.userId, _selectUserUnsolvedQuestionKeyPagination(question.userId).addOne(serverId)),
      newUploadableCollection: uploadableCollection.remove(question.id),
    );
  QuestionsState uploadFailed(String questionId) =>
    _optional(newUploadableCollection: uploadableCollection.failed(questionId));

  QuestionsState delete(QuestionState<int> question) =>
    _optional(
      newQuestions:
        loadableCollection.delete(question.id),
      newUserQuestions:
        userQuestions.setOne(question.userId,  userQuestions[question.userId]?.removeOne(question.id)),
      newUserSolvedQuestions:
        userSolvedQuestions.setOne(question.userId,  userSolvedQuestions[question.userId]?.removeOne(question.id)),
      newUserUnsolvedQuestions:
        userUnsolvedQuestions.setOne(question.userId,  userUnsolvedQuestions[question.userId]?.removeOne(question.id)),
    );
  QuestionsState like(QuestionState<int> question) =>
    _optional(newQuestions: loadableCollection.update(question.id, question.like()));
  QuestionsState dislike(QuestionState<int> question) =>
    _optional(newQuestions: loadableCollection.update(question.id, question.dislike()));
  //questions

  //solutions
  QuestionsState createSolution(SolutionState solution) =>
    _optional(
      newQuestions: loadableCollection.update(
        solution.questionId,
        loadableCollection[solution.questionId].entity?.createSolution(solution)
      )
    );
  QuestionsState deleteSolution(SolutionState solution) =>
    _optional(
      newQuestions: loadableCollection.update(
        solution.questionId,
        loadableCollection[solution.questionId].entity?.deleteSolution(solution)
      )
    );
  //solutions

  //home questions
  QuestionsState startNextHomeQuestions() => 
    _optional(newHomeQuestions: homeQuestions.startNext());
  QuestionsState addNextHomeQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshHomeQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newHomeQuestions: homeQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextHomeQuestions() => 
    _optional(newHomeQuestions: homeQuestions.stopNext());
  ContainerPagination<int, QuestionState<int>> selectHomeQuestions() =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(loadableCollection, homeQuestions);
  //home questions

  //search questions
  QuestionsState startNextSearchQuestions() => 
    _optional(newSearchQuestions: searchQuestions.startNext());
  QuestionsState addNextSearchQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshSearchQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSearchQuestions: searchQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextSearchQuestions() => 
    _optional(newSearchQuestions: searchQuestions.stopNext());
  ContainerPagination<int, QuestionState<int>> selectSearchPageQuestions() =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(loadableCollection, searchQuestions);
  //search questions

  //video questions
  QuestionsState startNextVideoQuestions() => 
    _optional(newVideoQuestions: videoQuestions.startNext());
  QuestionsState addNextVideoQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.addNext(questions.map((e) => e.id))
    );
  QuestionsState refreshVideoQuestions(Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newVideoQuestions: videoQuestions.refresh(questions.map((e) => e.id))
    );
  QuestionsState stopNextVideoQuestions() => 
    _optional(newVideoQuestions: videoQuestions.stopNext());
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
  QuestionsState addNextUserQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserQuestions: userQuestions.setOne(
        userId,
        _selectUserQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectUserQuestions(int userId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(
      loadableCollection,
      _selectUserQuestionKeyPagination(userId)
    );
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
  QuestionsState addNextUserSolvedQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        _selectUserSolvedQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserSolvedQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectUserSolvedQuestions(int userId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(loadableCollection,_selectUserSolvedQuestionKeyPagination(userId));
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
  QuestionsState addNextUserUnsolvedQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        _selectUserUnsolvedQuestionKeyPagination(userId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshUserUnsolvedQuestions(int userId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectUserUnsolvedQuestions(int userId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(loadableCollection,_selectUserUnsolvedQuestionKeyPagination(userId));
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
  QuestionsState addNextExamQuestions(int examId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newExamQuestions: examQuestions.setOne(
        examId,
        _selectExamQuestionKeyPagination(examId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshExamQuestions(int examId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectExamQuestions(int examId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(loadableCollection, _selectExamQuestionKeyPagination(examId));
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
  QuestionsState addNextSubjectQuestions(int subjectId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        _selectSubjectQuestionKeyPagination(subjectId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshSubjectQuestions(int subjectId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectSubjectQuestions(int subjectId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(
      loadableCollection,
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
  QuestionsState addNextTopicQuestions(int topicId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        _selectTopicQuestionKeyPagination(topicId).addNext(questions.map((e) => e.id))
      ),
    );
  QuestionsState refreshTopicQuestions(int topicId, Iterable<QuestionState<int>> questions) =>
    _optional(
      newQuestions: loadableCollection.loadSuccessMany({ for (var e in questions) e.id : e }),
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
  ContainerPagination<int, QuestionState<int>> selectTopicQuestions(int topicId) =>
    ContainerPagination<int, QuestionState<int>>.fromCollection(
      loadableCollection,
      _selectTopicQuestionKeyPagination(topicId)
    );
  //topic questions
}