import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';

@immutable
class AddQuestionImageAction extends redux.Action{
  final QuestionImageState value;
  const AddQuestionImageAction({required this.value});
}
@immutable
class AddQuestionImagesAction extends redux.Action{
  final Iterable<QuestionImageState> values;
  const AddQuestionImagesAction({required this.values});
}
@immutable
class AddQuestionImagesListAction extends redux.Action{
  final Iterable<Iterable<QuestionImageState>> lists;
  const AddQuestionImagesListAction({required this.lists});
}

@immutable
class LoadQuestionImageAction extends redux.Action{
  final int id;
  const LoadQuestionImageAction({required this.id});
}
@immutable
class LoadQuestionImageSuccessAction extends redux.Action{
  final int id;
  final Uint8List image;
  const LoadQuestionImageSuccessAction({required this.id,required this.image});
}