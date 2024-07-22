import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart/entity_state.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';

@immutable
class QuestionImageEntityState extends EntityState<QuestionImageState>{
  const QuestionImageEntityState({required super.entities});

  QuestionImageEntityState addValue(QuestionImageState value)
    => QuestionImageEntityState(entities: addOneEnd(value));

  QuestionImageEntityState addValues(Iterable<QuestionImageState> values)
    => QuestionImageEntityState(entities: addManyEnd(values));

  QuestionImageEntityState addLists(Iterable<Iterable<QuestionImageState>> lists)
    => QuestionImageEntityState(entities: addListsEnd(lists));

  QuestionImageEntityState startLoading(int id)
    => QuestionImageEntityState(entities: updateOne(entities[id]!.startLoading()));

  QuestionImageEntityState loadImage(int id,Uint8List image)
    => QuestionImageEntityState(entities: updateOne(entities[id]!.load(image)));

  Iterable<QuestionImageState> getQuestionImages(int questionId)
    => entities.values.where((x) => x.questionId == questionId);
}