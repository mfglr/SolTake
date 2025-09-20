import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/base_container.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/load_status.dart';

@immutable
class LoadableContainer<K, V> extends BaseContainer<K>{
  final V? entity;
  final LoadStatus status;

  const LoadableContainer._({
    required super.key,
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
    required super.key
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

  LoadableContainer<K, V> update(V? entity) =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: status
    );
  
  LoadableContainer<K, V> reload() =>
    LoadableContainer<K,V>._(
      key: key,
      entity: entity,
      status: LoadStatus.loading
    );
}