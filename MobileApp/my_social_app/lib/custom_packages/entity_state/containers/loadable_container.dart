import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/load_status.dart';

@immutable
class LoadableContainer<K, V> implements BaseContainer{
  final K key;
  final V? entity;
  final LoadStatus status;

  const LoadableContainer._({
    required this.key,
    required this.entity,
    required this.status
  });

  factory LoadableContainer.success(K key, V entity)
    => LoadableContainer._(
        key: key,
        entity: entity,
        status: LoadStatus.success
      );

  const LoadableContainer({
    required this.key
  }) : 
    entity = null,
    status = LoadStatus.pending;

  LoadableContainer<K, V> loading() =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: LoadStatus.loading
    );

  LoadableContainer<K, V> success(V entity) =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: LoadStatus.success
    );

  LoadableContainer<K, V> failed() =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: LoadStatus.failed
    );

  LoadableContainer<K, V> notFound() =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: LoadStatus.notFound
    );
}