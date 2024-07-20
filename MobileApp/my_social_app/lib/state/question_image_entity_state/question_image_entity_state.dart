import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';

@immutable
class QuestionImageEntityState{
  final Map<int,QuestionImageState> images;
  const QuestionImageEntityState({required this.images});

  Map<int,QuestionImageState> _clone(){
    final Map<int,QuestionImageState> clone = {};
    clone.addAll(images);
    return clone;
  }

  QuestionImageEntityState addValue(QuestionImageState value){
    final clone = _clone();
    if(clone[value.id] == null){
      clone.addEntries([MapEntry(value.id, value)]);
    }
    return QuestionImageEntityState(images: clone);
  }
  QuestionImageEntityState addValues(Iterable<QuestionImageState> values){
    final Map<int,QuestionImageState> clone = _clone();
    final notAvaiable = values.where((e) => images[e.id] == null);
    clone.addEntries(notAvaiable.map((e) => MapEntry(e.id, e)));
    return QuestionImageEntityState(images: clone);
  }
  QuestionImageEntityState addLists(Iterable<Iterable<QuestionImageState>> iterables){
    final Map<int,QuestionImageState> clone = _clone();
    for(final iterable in iterables){
      var notAvaiable = iterable.where((e) => images[e.id] == null);
      clone.addEntries(notAvaiable.map((e) => MapEntry(e.id, e)));
    }
    return QuestionImageEntityState(images: clone);
  }


  QuestionImageEntityState startLoadingImage(int id){
    final clone = _clone();
    clone[id] = clone[id]!.startLoading();
    return QuestionImageEntityState(images: clone); 
  }
  QuestionImageEntityState loadImage(int id,Uint8List image){
    final clone = _clone();
    clone[id] = clone[id]!.load(image);
    return QuestionImageEntityState(images: clone); 
  }

  Iterable<QuestionImageState> getQuestionImages(int questionId)
    => images.values.where((x) => x.questionId == questionId);
}