import 'package:flutter/widgets.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';

@immutable
class EntityContainer<K,V> {
  final K key;
  final EntityStatus status;
  final V? entity;
  final double rate;

  String get rateToString => "${(rate * 100).round()} %";
  bool get isLoadSuccess => status == EntityStatus.loadSuccess;
  bool get isNotLoadSuccess => status != EntityStatus.loadSuccess;

  bool get isUploadable =>
    status == EntityStatus.processing ||
    status == EntityStatus.uploadFailed ||
    status == EntityStatus.uploading;

  const EntityContainer._({
    required this.key,
    required this.status,
    required this.entity,
    required this.rate
  });

  factory EntityContainer.loadSuccess(K key, V entity) =>
    EntityContainer<K,V>._(
      key: key,
      status: EntityStatus.loadSuccess,
      entity: entity,
      rate: 0
    );

  factory EntityContainer.create(K key) => 
    EntityContainer<K, V>._(
      key: key,
      status: EntityStatus.created,
      entity: null,
      rate: 0,
    );
  
  EntityContainer<K,V> load() => 
    EntityContainer<K,V>._(
      key: key,
      status: EntityStatus.loading,
      entity: null,
      rate: rate
    );
  EntityContainer<K,V> loadSuccess(V entity) =>
    EntityContainer._(
      key: key,
      status: EntityStatus.loadSuccess,
      entity: entity,
      rate: rate
    );
  EntityContainer<K, V> loadFailed() =>
    EntityContainer._(
      key: key,
      status: EntityStatus.loadFailed,
      entity: entity,
      rate: rate
    );
  EntityContainer<K, V> notFound() =>
    EntityContainer._(
      key: key,
      status: EntityStatus.notFound,
      entity: null,
      rate: rate
    );

  EntityContainer<K, V> upload(V entity) => 
    EntityContainer<K, V>._(
      key: key,
      status: EntityStatus.uploading,
      entity: entity,
      rate: rate
    );
  EntityContainer<K, V> changeRate(double rate) =>
    EntityContainer<K, V>._(
      key: key,
      status: status,
      entity: entity,
      rate: rate
    );
  EntityContainer<K, V> processing() =>
    EntityContainer<K, V>._(
      key: key,
      status: EntityStatus.processing,
      entity: entity,
      rate: 1
    );
  EntityContainer<K,V> uploadFailed() => 
    EntityContainer<K, V>._(
      key: key,
      status: EntityStatus.uploadFailed,
      entity: entity,
      rate: 0
    );

  EntityContainer<K, V> update(V? entity,{String? message}) =>
    EntityContainer<K, V>._(
      key: key,
      status: status,
      entity: entity,
      rate: rate
    );

  EntityContainer<K, V> delete() =>
    EntityContainer<K, V>._(
      key: key,
      status: EntityStatus.notFound,
      entity: null,
      rate: rate
    );
}