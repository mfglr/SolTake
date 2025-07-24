import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
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

  QuestionsState optional({
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

  //solutions
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
  //solutions

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
  
  // question user saves
  QuestionsState save(QuestionUserSaveState questionUserSave){
    var question = questionUserSave.toQuestionState();
    return optional(
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
    return optional(
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
    optional(newQuestionUserSaves: questionUserSaves.startLoadingNext());
  QuestionsState addNextPageQuestionUserSaves(Iterable<QuestionUserSaveState> questionUserSaves) =>
    optional(newQuestionUserSaves: this.questionUserSaves.addNextPage(questionUserSaves));
  QuestionsState refreshQuesitonUserSaves(Iterable<QuestionUserSaveState> questionUserSaves) =>
    optional(newQuestionUserSaves: this.questionUserSaves.refreshPage(questionUserSaves));
  QuestionsState stopLoadingNextQuestionUserSaves() =>
    optional(newQuestionUserSaves: questionUserSaves.stopLoadingNext());
  // question user saves

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