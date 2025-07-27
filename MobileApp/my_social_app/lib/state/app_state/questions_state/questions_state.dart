import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_status.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class QuestionsState{
  final Pagination<int,QuestionState> homePageQuestions;
  final Pagination<int,QuestionState> searchPageQuestions;
  final Pagination<int,QuestionUserSaveState> questionUserSaves;
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
    required this.questionUserSaves,
    required this.questionUserLikes
  });

  QuestionsState _optional({
    Pagination<int,QuestionState>? newHomePageQuestions,
    Pagination<int,QuestionUserSaveState>? newQuestionUserSaves,
    Pagination<int,QuestionState>? newSearchPageQuestions,
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
      questionUserSaves: newQuestionUserSaves ?? questionUserSaves,
      userQuestions: newUserQuestions ?? userQuestions,
      userSolvedQuestions: newUserSolvedQuestions ?? userSolvedQuestions,
      userUnsolvedQuestions:  newUserUnsolvedQuestions ?? userUnsolvedQuestions,
      examQuestions: newExamQuestions ?? examQuestions,
      subjectQuestions: newSubjectQuestions ?? subjectQuestions,
      topicQuestions: newTopicQuestions ?? topicQuestions,
      questionUserLikes: newQuestionUserLikes ?? questionUserLikes,
    );

  QuestionsState create(QuestionState question) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        question.userId,
        selectUserQuestionsFromState(this, question.userId).prependOne(question),
      ),
      newUserUnsolvedQuestions: userQuestions.setOne(
        question.userId,
        selectUserUnsolvedQuestionsFromState(this, question.userId).prependOne(question),
      )
    );
  QuestionsState delete(QuestionState question){
    var questionUserSave = questionUserSaves.get((e) => e.questionId == question.id);
    return _optional(
      newUserQuestions: userQuestions.setOne(
        question.userId,
        userQuestions[question.userId]?.removeOne(question.id)
      ),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        question.userId,
        userSolvedQuestions[question.userId]?.removeOne(question.id)
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        userUnsolvedQuestions[question.userId]?.removeOne(question.id)
      ),
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.removeOne(questionUserSave.id)
        : questionUserSaves,
    );
  }
  QuestionsState deleteSolution(QuestionState question, SolutionState solution){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      
      userQuestions:
        userQuestions.setOne(
          question.userId,
          userQuestions[question.userId]?.updateOne(question.deleteSolution(solution))
        ),
      
      userSolvedQuestions: 
        userSolvedQuestions.setOne(
          question.userId,
          question.numberOfCorrectSolutions == 1 && solution.state == SolutionStatus.correct
            ? userSolvedQuestions[question.userId]?.removeOne(question.id)
            : userSolvedQuestions[question.userId]?.updateOne(question.deleteSolution(solution))
        ),

      userUnsolvedQuestions:
        userUnsolvedQuestions.setOne(
          question.userId,
          question.numberOfCorrectSolutions == 1 && solution.state == SolutionStatus.correct
            ? userUnsolvedQuestions[question.userId]?.addInOrder(question.deleteSolution(solution))
            : userUnsolvedQuestions[question.userId]?.updateOne(question.deleteSolution(solution))
        ),

      examQuestions: 
        examQuestions.setOne(
          question.exam.id,
          examQuestions[question.exam.id]?.updateOne(question.deleteSolution(solution))
        ),

      subjectQuestions:
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.deleteSolution(solution))
        ),

      topicQuestions:
        question.topic != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.deleteSolution(solution))
            )
          : topicQuestions,

      searchPageQuestions: searchPageQuestions.updateOne(question.deleteSolution(solution)),
      homePageQuestions: homePageQuestions.updateOne(question.deleteSolution(solution)),
      
      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.deleteSolution(solution))
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
  QuestionsState markSolutionAsCorrect(QuestionState question, SolutionState solution){
    if(question.state == QuestionStatus.solved) return this;
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return _optional(
      newUserQuestions: userQuestions.setOne(
        question.userId,
        userQuestions[question.userId]?.updateOne(question.markSolutionAsCorrect(solution))
      ),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        question.userId,
        userSolvedQuestions[question.userId]?.addInOrder(question.markSolutionAsCorrect(solution))
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        userUnsolvedQuestions[question.userId]?.removeOne(question.id)
      ),
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.updateOne(questionUserSave.markSolutionAsCorrect(solution))
        : questionUserSaves,
    );
  }
  QuestionsState markSolutionAsIncorrect(QuestionState question, SolutionState solution){
    if(question.state == QuestionStatus.unsolved) return this;
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return _optional(
      newUserQuestions: userQuestions.setOne(
        question.userId,
        userQuestions[question.userId]?.updateOne(question.markSolutionAsIncorrect(solution))
      ),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        question.userId,
        userSolvedQuestions[question.userId]?.addInOrder(question.markSolutionAsIncorrect(solution))
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        userUnsolvedQuestions[question.userId]?.removeOne(question.id)
      ),
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.updateOne(questionUserSave.markSolutionAsIncorrect(solution))
        : questionUserSaves,
    );
  }

  // question user likes
  QuestionsState startLoadingNextQuestionUserLikes(int questionId) =>
    _optional(
      newQuestionUserLikes: questionUserLikes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).startLoadingNext()
      )
    );
  QuestionsState addNextPageQuestionUserLikes(int questionId, Iterable<QuestionUserLikeState> likes) =>
    _optional(
      newQuestionUserLikes: questionUserLikes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).addNextPage(likes)
      )
    );
  QuestionsState refreshQuestionUserLikes(int questionId, Iterable<QuestionUserLikeState> likes) =>
    _optional(
      newQuestionUserLikes: questionUserLikes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).refreshPage(likes)
      )
    );
  QuestionsState stopLoadingNextQuestionUserLikes(int questionId) =>
    _optional(
      newQuestionUserLikes: questionUserLikes.setOne(
        questionId,
        selectQuestionUserLikesFromState(this, questionId).stopLoadingNext()
      )
    );
  QuestionsState like(QuestionState question, QuestionUserLikeState questionUserLike){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      examQuestions:
        examQuestions.setOne(
          question.exam.id,
          examQuestions[question.exam.id]?.updateOne(question.like())
        ),

      subjectQuestions:
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.like())
        ),

      topicQuestions: 
        question.topic != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.like())
            )
          : topicQuestions,

      userQuestions:
        userQuestions.setOne(
          question.userId,
          userQuestions[question.userId]?.updateOne(question.like())
        ),

      userSolvedQuestions:
        userSolvedQuestions.setOne(
          question.userId,
          userSolvedQuestions[question.userId]?.updateOne(question.like())
        ),

      userUnsolvedQuestions: 
        userUnsolvedQuestions.setOne(
          question.userId,
          userUnsolvedQuestions[question.userId]?.updateOne(question.like()) 
        ),

      homePageQuestions: homePageQuestions.updateOne(question.like()),
      searchPageQuestions: searchPageQuestions.updateOne(question.like()),

      questionUserSaves: 
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.like())
          : questionUserSaves,

      questionUserLikes:
        questionUserLikes.updateElsePrependOne(
          question.id,
          (questionUserLikes[question.id] ?? Pagination.init(questionUserLikesPerPage, true)).prependOne(questionUserLike)
        )
    );
  }
  QuestionsState dislike(QuestionState question, int userId){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      examQuestions:
        examQuestions.setOne(
          question.exam.id,
          examQuestions[question.exam.id]?.updateOne(question.dislike())
        ),

      subjectQuestions:
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.dislike())
        ),

      topicQuestions:
        question.topic != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.dislike())
            )
          : topicQuestions,

      userQuestions:
        userQuestions.setOne(
          question.userId,
          userQuestions[question.userId]?.updateOne(question.dislike())
        ),

      userSolvedQuestions:
        userSolvedQuestions.setOne(
          question.userId,
          userSolvedQuestions[question.userId]?.updateOne(question.dislike())
        ),

      userUnsolvedQuestions:
        userUnsolvedQuestions.setOne(
          question.userId,
          userUnsolvedQuestions[question.userId]?.updateOne(question.dislike()) 
        ),

      homePageQuestions: homePageQuestions.updateOne(question.dislike()),
      searchPageQuestions: searchPageQuestions.updateOne(question.dislike()),
      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.dislike())
          : questionUserSaves,

      questionUserLikes:
        questionUserLikes[question.id] != null
          ? questionUserLikes.updateOne(
              question.id,
              questionUserLikes[question.id]!.where((e) => e.userId != userId)
            )
          : questionUserLikes
    );
  }
  // question user likes

  // question user saves
  QuestionsState save(QuestionUserSaveState questionUserSave){
    var question = questionUserSave.toQuestionState();
    return _optional(
      newExamQuestions: examQuestions.setOne(
        question.exam.id,
        examQuestions[question.exam.id]?.updateOne(question.save())
      ),
      newSubjectQuestions: subjectQuestions.setOne(
        question.subject.id,
        subjectQuestions[question.subject.id]?.updateOne(question.save())
      ),
      newTopicQuestions: question.topic != null
        ? topicQuestions.setOne(
            question.topic!.id,
            topicQuestions[question.topic!.id]?.updateOne(question.save())
          )
        : topicQuestions,
      newUserQuestions: userQuestions.setOne(
        question.userId,
        userQuestions[question.userId]?.updateOne(question.save())
      ),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        question.userId,
        userSolvedQuestions[question.userId]?.updateOne(question.save())
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        userUnsolvedQuestions[question.userId]?.updateOne(question.save())
      ),
      newHomePageQuestions: homePageQuestions.updateOne(question.save()),
      newQuestionUserSaves: questionUserSaves.prependOne(questionUserSave.save()),
      newSearchPageQuestions: searchPageQuestions.updateOne(question.save()),
    );
  }
  QuestionsState unsave(QuestionState question){
    var questionUserSave = questionUserSaves.get((e) => e.questionId == question.id);
    return _optional(
      newExamQuestions: examQuestions.setOne(
        question.exam.id,
        examQuestions[question.exam.id]?.updateOne(question.unsave())
      ),
      newSubjectQuestions: subjectQuestions.setOne(
        question.subject.id,
        subjectQuestions[question.subject.id]?.updateOne(question.unsave())
      ),
      newTopicQuestions: question.topic != null
        ? topicQuestions.setOne(
            question.topic!.id,
            topicQuestions[question.topic!.id]?.updateOne(question.unsave())
          )
        : topicQuestions,
      newUserQuestions: userQuestions.setOne(
        question.userId,
        userQuestions[question.userId]?.updateOne(question.unsave())
      ),
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        question.userId,
        userSolvedQuestions[question.userId]?.updateOne(question.unsave())
      ),
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        question.userId,
        userUnsolvedQuestions[question.userId]?.updateOne(question.unsave())
      ),
      newHomePageQuestions: homePageQuestions.updateOne(question.unsave()),
      newQuestionUserSaves: questionUserSave != null ? questionUserSaves.removeOne(questionUserSave.id) : questionUserSaves,
      newSearchPageQuestions: searchPageQuestions.updateOne(question.unsave()),
    );
  }
  QuestionsState startLoadingQuestionUserSaves() => 
    _optional(newQuestionUserSaves: questionUserSaves.startLoadingNext());
  QuestionsState addNextPageQuestionUserSaves(Iterable<QuestionUserSaveState> questionUserSaves) =>
    _optional(newQuestionUserSaves: this.questionUserSaves.addNextPage(questionUserSaves));
  QuestionsState refreshQuesitonUserSaves(Iterable<QuestionUserSaveState> questionUserSaves) =>
    _optional(newQuestionUserSaves: this.questionUserSaves.refreshPage(questionUserSaves));
  QuestionsState stopLoadingNextQuestionUserSaves() =>
    _optional(newQuestionUserSaves: questionUserSaves.stopLoadingNext());
  // question user saves

  //home page questions
  QuestionsState startLoadingHomePageQuestions() =>
    _optional(newHomePageQuestions: homePageQuestions.startLoadingNext());
  QuestionsState addNextPageHomePageQuestions(Iterable<QuestionState> questions) =>
    _optional(newHomePageQuestions: homePageQuestions.addNextPage(questions));
  QuestionsState refreshHomePageQuestions(Iterable<QuestionState> questions) =>
    _optional(newHomePageQuestions: homePageQuestions.refreshPage(questions));
  QuestionsState stopLoadingHomePageQuestions() =>
    _optional(newHomePageQuestions: homePageQuestions.stopLoadingNext());
  //home page questions

  // user questions
  QuestionsState startLoadingNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        selectUserQuestionsFromState(this, userId).startLoadingNext()
      )
    );
  QuestionsState addNextPageUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        userQuestions[userId]?.addNextPage(questions)
      )
    );
  QuestionsState refreshUserQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        userQuestions[userId]?.refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextUserQuestions(int userId) =>
    _optional(
      newUserQuestions: userQuestions.setOne(
        userId,
        userQuestions[userId]?.stopLoadingNext()
      )
    );
  // user questions

  // user solved questions
  QuestionsState startLoadingNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        selectUserSolvedQuestionsFromState(this, userId).startLoadingNext()
      )
    );
  QuestionsState addNextPageUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        userSolvedQuestions[userId]?.addNextPage(questions)
      )
    );
  QuestionsState refreshUserSolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        userSolvedQuestions[userId]?.refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextUserSolvedQuestions(int userId) =>
    _optional(
      newUserSolvedQuestions: userSolvedQuestions.setOne(
        userId,
        userSolvedQuestions[userId]?.stopLoadingNext()
      )
    );
  // user solved questions

  // user unsolved questions
  QuestionsState startLoadingNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        selectUserUnsolvedQuestionsFromState(this, userId).startLoadingNext()
      )
    );
  QuestionsState addNextPageUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        userUnsolvedQuestions[userId]?.addNextPage(questions)
      )
    );
  QuestionsState refreshUserUnsolvedQuestions(int userId, Iterable<QuestionState> questions) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        userUnsolvedQuestions[userId]?.refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextUserUnsolvedQuestions(int userId) =>
    _optional(
      newUserUnsolvedQuestions: userUnsolvedQuestions.setOne(
        userId,
        userUnsolvedQuestions[userId]?.stopLoadingNext()
      )
    );
  // user unsolved questions

  //exams questions
  QuestionsState startLoadingNextExamQuestions(int examId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        selectExamQuestionsFromState(this,examId).startLoadingNext()
      )
    );
  QuestionsState addNextPageExamQustions(int examId, Iterable<QuestionState> questions) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        selectExamQuestionsFromState(this,examId).addNextPage(questions)
      )
    );
  QuestionsState refreshExamQuestions(int examId, Iterable<QuestionState> questions) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        selectExamQuestionsFromState(this,examId).refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextExamQuestions(int examId) =>
    _optional(
      newExamQuestions: examQuestions.setOne(
        examId,
        selectExamQuestionsFromState(this,examId).stopLoadingNext()
      )
    );
  //exams questions

  //subject questions
  QuestionsState startLoadingNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionsFromState(this,subjectId).startLoadingNext()
      )
    );
  QuestionsState addNextPageSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionsFromState(this,subjectId).addNextPage(questions)
      )
    );
  QuestionsState refreshSubjectQuestions(int subjectId, Iterable<QuestionState> questions) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionsFromState(this,subjectId).refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextSubjectQuestions(int subjectId) =>
    _optional(
      newSubjectQuestions: subjectQuestions.setOne(
        subjectId,
        selectSubjectQuestionsFromState(this,subjectId).stopLoadingNext()
      )
    );
  //topic questions

  //topic questions
  QuestionsState startLoadingNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionsFromState(this,topicId).startLoadingNext()
      )
    );
  QuestionsState addNextPageTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionsFromState(this,topicId).addNextPage(questions)
      )
    );
  QuestionsState refreshTopicQuestions(int topicId, Iterable<QuestionState> questions) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionsFromState(this,topicId).refreshPage(questions)
      )
    );
  QuestionsState stopLoadingNextTopicQuestions(int topicId) =>
    _optional(
      newTopicQuestions: topicQuestions.setOne(
        topicId,
        selectTopicQuestionsFromState(this,topicId).stopLoadingNext()
      )
    );
  //topic questions

  //search questions
  QuestionsState startLoadingNextSearchPageQuestions() =>
    _optional(newSearchPageQuestions: searchPageQuestions.startLoadingNext());
  QuestionsState addNextPageSearchPageQuestions(Iterable<QuestionState> questions) =>
    _optional(newSearchPageQuestions: searchPageQuestions.addNextPage(questions));
  QuestionsState refreshSearchPageQuestions(Iterable<QuestionState> questions) =>
    _optional(newSearchPageQuestions: searchPageQuestions.refreshPage(questions));
  QuestionsState stopLoadingNextSearchPageQuestions() =>
    _optional(newSearchPageQuestions: searchPageQuestions.stopLoadingNext());
  //search quesitons

  QuestionsState increaseNumberOfComments(QuestionState question){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
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
      
      searchPageQuestions: searchPageQuestions.updateOne(question.increaseNumberOfComments()),
      
      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.increaseNumberOfComments())
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
  QuestionsState createSolution(QuestionState question, SolutionState solution){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      examQuestions:
        examQuestions[question.exam.id] != null
          ? examQuestions.updateOne(
              question.exam.id,
              examQuestions[question.exam.id]!.updateOne(question.createSolution(solution))
            )
          : examQuestions,
      subjectQuestions: subjectQuestions[question.subject.id] != null
        ? subjectQuestions.updateOne(
            question.subject.id,
            subjectQuestions[question.subject.id]!.updateOne(question.createSolution(solution))
          )
        : subjectQuestions,
      topicQuestions: 
        question.topic?.id != null && topicQuestions[question.topic?.id] != null
          ? topicQuestions.updateOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]!.updateOne(question.createSolution(solution))
            )
          : topicQuestions,
      userQuestions: userQuestions[question.userId] != null
        ? userQuestions.updateOne(
            question.userId,
            userQuestions[question.userId]!.updateOne(question.createSolution(solution))
          )
        : userQuestions,
      userSolvedQuestions: userSolvedQuestions[question.userId] != null
        ? userSolvedQuestions.updateOne(
            question.userId,
            userSolvedQuestions[question.userId]!.updateOne(question.createSolution(solution))
          )
        : userSolvedQuestions,
      userUnsolvedQuestions: userUnsolvedQuestions[question.userId] != null
        ? userUnsolvedQuestions.updateOne(
            question.userId,
            userUnsolvedQuestions[question.userId]!.updateOne(question.createSolution(solution)) 
          )
        : userUnsolvedQuestions,
      homePageQuestions: homePageQuestions.updateOne(question.createSolution(solution)),
      
      searchPageQuestions: searchPageQuestions.updateOne(question.createSolution(solution)),

      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.createSolution(solution))
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
}