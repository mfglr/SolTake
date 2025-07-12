import 'package:flutter/widgets.dart';
import 'package:test_app/state/entity_state/entity.dart';

@immutable
class PaginationAction{
  final String context;
  const PaginationAction({required this.context});
}

@immutable
class NextAction extends PaginationAction{
  final dynamic parameters;
  const NextAction({required super.context, this.parameters});
}
@immutable
class NextSuccessAction<K extends Comparable, V extends Entity<K>> extends PaginationAction{
  final Iterable<V> entities;
  const NextSuccessAction({required super.context, required this.entities});
}
@immutable
class NextFailedAction extends PaginationAction{
  const NextFailedAction({required super.context});
}

@immutable
class RefreshAction extends PaginationAction{
  final dynamic parameters;
  const RefreshAction({required super.context, this.parameters});
}
@immutable
class RefreshSuccessAction<K extends Comparable, V extends Entity<K>> extends PaginationAction{
  final Iterable<V> entities;
  const RefreshSuccessAction({required super.context, required this.entities});
}
@immutable
class RefreshFailedAction extends PaginationAction{
  const RefreshFailedAction({required super.context});
}

@immutable
class PrevAction extends PaginationAction{
  final dynamic parameters;
  const PrevAction({required super.context, this.parameters});
}
@immutable
class PrevSuccessAction<K extends Comparable, V extends Entity<K>> extends PaginationAction{
  final Iterable<V> entities;
  const PrevSuccessAction({required super.context, required this.entities});
}
@immutable
class PrevFailedAction extends PaginationAction{
  const PrevFailedAction({required super.context});
}