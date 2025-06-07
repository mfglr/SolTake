import 'package:flutter/widgets.dart';

@immutable
class Action{
  const Action();
}

@immutable
class AppAction extends Action{
  const AppAction();
}

@immutable
class ClearStateAction  extends Action{
  const ClearStateAction();
}