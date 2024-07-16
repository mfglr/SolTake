import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class QuestionEntityState{
  final Map<int,QuestionState> questions;
  const QuestionEntityState({required this.questions});
  
  QuestionEntityState loadQuestions(List<QuestionState> questions){
    final Map<int,QuestionState> clone = {};
    final uniqQuestions = questions.where((question) => this.questions[question.id] == null);
    clone.addAll(this.questions);
    clone.addEntries(uniqQuestions.map((e) => MapEntry(e.id, e)));
    return QuestionEntityState(questions: clone);
  }

  QuestionEntityState addQuestion(QuestionState question){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone.addEntries([MapEntry(question.id, question)]);
    return QuestionEntityState(questions: clone);
  }

  QuestionEntityState startLoadingImage(int questionId,int index){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.startLoadingImage(index);
    return QuestionEntityState(questions: clone);
  }

  QuestionEntityState loadImage(int questionId,int index,Uint8List image){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.loadImage(index,image);
    return QuestionEntityState(questions: clone);
  }

  QuestionEntityState like(int questionId){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.like();
    return QuestionEntityState(questions: clone);
  }

  QuestionEntityState dislike(int questionId){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.dislike();
    return QuestionEntityState(questions: clone);
  }
}