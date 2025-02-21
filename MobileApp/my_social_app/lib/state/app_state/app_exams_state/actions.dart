import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class NextExamsAction extends AppAction{
  const NextExamsAction();
}
@immutable
class NextExamsSuccessAction extends AppAction{
  final Iterable<num> examIds;
  const NextExamsSuccessAction({required this.examIds});
}
@immutable
class NextExamsFailedAction extends AppAction{
  const NextExamsFailedAction();
}