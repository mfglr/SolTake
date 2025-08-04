import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_status.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class QuestionsState{
  final EntityCollection<int,QuestionState> questions;
  final Pagination<int,QuestionState> searchPageQuestions;
  final Pagination<int,QuestionState> videoQuestions;
  final Pagination<int,QuestionUserSaveState> questionUserSaves;
  final Map<int,Pagination<int,QuestionState>> subjectQuestions;
  final Map<int,Pagination<int,QuestionState>> topicQuestions;
  final Map<int, Pagination<int, QuestionUserLikeState>> questionUserLikes;

  const QuestionsState({
    required this.questions,
    required this.videoQuestions,
    required this.subjectQuestions,
    required this.topicQuestions,
    required this.searchPageQuestions,
    required this.questionUserSaves,
    required this.questionUserLikes
  });

  QuestionsState _optional({
    EntityCollection<int, QuestionState>? newQuestions,
    Pagination<int, QuestionState>? newSearchPageQuestions,
    Pagination<int, QuestionState>? newVideoQuestions,
    Pagination<int, QuestionUserSaveState>? newQuestionUserSaves,
    Map<int,Pagination<int, QuestionState>>? newSubjectQuestions,
    Map<int,Pagination<int, QuestionState>>? newTopicQuestions,
    Map<int, Pagination<int, QuestionUserLikeState>>? newQuestionUserLikes,
  })
    =>
    QuestionsState(
      questions: newQuestions ?? questions,
      searchPageQuestions: newSearchPageQuestions ?? searchPageQuestions,
      videoQuestions: newVideoQuestions ?? videoQuestions,
      questionUserSaves: newQuestionUserSaves ?? questionUserSaves,
      subjectQuestions: newSubjectQuestions ?? subjectQuestions,
      topicQuestions: newTopicQuestions ?? topicQuestions,
      questionUserLikes: newQuestionUserLikes ?? questionUserLikes,
    );

  QuestionsState load(int questionId) => _optional(newQuestions: questions.loading(questionId));
  QuestionsState success(QuestionState question) => _optional(newQuestions: questions.success(question.id, question));
  QuestionsState failed(int questionId) => _optional(newQuestions: questions.failed(questionId));
  QuestionsState notFound(int questionId) => _optional(newQuestions: questions.notFound(questionId));

  QuestionsState create(QuestionState question) =>
    _optional();
  QuestionsState delete(QuestionState question){
    var questionUserSave = questionUserSaves.get((e) => e.questionId == question.id);
    return _optional(
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.removeOne(questionUserSave.id)
        : questionUserSaves,
    );
  }
  
  //solutions
  QuestionsState createSolution(QuestionState question, SolutionState solution){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      questions: questions.setOne(solution.questionId, question.createSolution(solution)),
      
      subjectQuestions:
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.createSolution(solution))
        ),
      topicQuestions: 
        question.topic != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.createSolution(solution))
            )
          : topicQuestions,
      searchPageQuestions: searchPageQuestions.updateOne(question.createSolution(solution)),
      videoQuestions: videoQuestions.updateOne(question.createSolution(solution)),

      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.createSolution(solution))
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
  QuestionsState deleteSolution(QuestionState question, SolutionState solution){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      questions: questions.setOne(solution.questionId, question.deleteSolution(solution)),

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
      videoQuestions: videoQuestions.updateOne(question.deleteSolution(solution)),
      
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
      newQuestions: questions.setOne(solution.questionId, question.markSolutionAsCorrect(solution)),
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.updateOne(questionUserSave.markSolutionAsCorrect(solution))
        : questionUserSaves,
    );
  }
  QuestionsState markSolutionAsIncorrect(QuestionState question, SolutionState solution){
    if(question.state == QuestionStatus.unsolved) return this;
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return _optional(
      newQuestions: questions.setOne(solution.questionId, question.markSolutionAsIncorrect(solution)),
      newQuestionUserSaves: questionUserSave != null
        ? questionUserSaves.updateOne(questionUserSave.markSolutionAsIncorrect(solution))
        : questionUserSaves,
    );
  }
  //solutions

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
      questions: questions.setOne(question.id, question.like()),
     
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

      searchPageQuestions: searchPageQuestions.updateOne(question.like()),
      videoQuestions: videoQuestions.updateOne(question.like()),

      questionUserSaves: 
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.like())
          : questionUserSaves,

      questionUserLikes:
        questionUserLikes.setOne(
          question.id,
          (questionUserLikes[question.id] ?? Pagination.init(questionUserLikesPerPage, true)).prependOne(questionUserLike)
        )
    );
  }
  QuestionsState dislike(QuestionState question, int userId){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      questions: questions.setOne(question.id, question.dislike()),

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

      searchPageQuestions: searchPageQuestions.updateOne(question.dislike()),
      videoQuestions: videoQuestions.updateOne(question.dislike()),

      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.dislike())
          : questionUserSaves,

      questionUserLikes:
        questionUserLikes.setOne(
          question.id,
          questionUserLikes[question.id]?.where((e) => e.userId != userId)
        )
    );
  }
  // question user likes

  // question user saves
  QuestionsState save(QuestionUserSaveState questionUserSave){
    var question = questionUserSave.toQuestionState();
    return _optional(
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
      
      newSearchPageQuestions: searchPageQuestions.updateOne(question.save()),
      newVideoQuestions: videoQuestions.updateOne(question.save()),

      newQuestionUserSaves: questionUserSaves.prependOne(questionUserSave.save()),
    );
  }
  QuestionsState unsave(QuestionState question){
    var questionUserSave = questionUserSaves.get((e) => e.questionId == question.id);
    return _optional(
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
      
      newSearchPageQuestions: searchPageQuestions.updateOne(question.unsave()),
      newVideoQuestions: videoQuestions.updateOne(question.unsave()),

      newQuestionUserSaves: questionUserSave != null ? questionUserSaves.removeOne(questionUserSave.id) : questionUserSaves,
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

  //video questions
  QuestionsState startLoadingNextVideoQuestions() =>
    _optional(newVideoQuestions: videoQuestions.startLoadingNext());
  QuestionsState addNextVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(newVideoQuestions: videoQuestions.addNextPage(questions));
  QuestionsState refreshVideoQuestions(Iterable<QuestionState> questions) =>
    _optional(newVideoQuestions: videoQuestions.refreshPage(questions));
  QuestionsState stopLoadingNextVideoQuestions() =>
    _optional(newVideoQuestions: videoQuestions.stopLoadingNext());
  //video questions


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
      questions: questions.setOne(question.id, question.increaseNumberOfComments()),
      subjectQuestions: 
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.increaseNumberOfComments())
        ),
      topicQuestions: 
        question.topic?.id != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.increaseNumberOfComments())
            )
          : topicQuestions,

      searchPageQuestions: searchPageQuestions.updateOne(question.increaseNumberOfComments()),
      videoQuestions: videoQuestions.updateOne(question.increaseNumberOfComments()),
      
      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.increaseNumberOfComments())
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
  QuestionsState decreaseNumberOfComments(QuestionState question){
    var questionUserSave = questionUserSaves.values.firstWhereOrNull((e) => e.questionId == question.id);
    return QuestionsState(
      questions: questions.setOne(question.id, question.decreaseNumberOfComments()),
      subjectQuestions: 
        subjectQuestions.setOne(
          question.subject.id,
          subjectQuestions[question.subject.id]?.updateOne(question.decreaseNumberOfComments())
        ),
      topicQuestions: 
        question.topic?.id != null
          ? topicQuestions.setOne(
              question.topic!.id,
              topicQuestions[question.topic!.id]?.updateOne(question.decreaseNumberOfComments())
            )
          : topicQuestions,
      searchPageQuestions: searchPageQuestions.updateOne(question.decreaseNumberOfComments()),
      videoQuestions: videoQuestions.updateOne(question.decreaseNumberOfComments()),
      
      questionUserSaves:
        questionUserSave != null
          ? questionUserSaves.updateOne(questionUserSave.decreaseNumberOfComments())
          : questionUserSaves,

      questionUserLikes: questionUserLikes
    );
  }
}