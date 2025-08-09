import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';

class NewEntityContainer<K extends Comparable, V extends Entity<K>> {
  final EntityStatus status;
  final V? entity;

  const NewEntityContainer({
    required this.status,
    required this.entity
  });

  factory NewEntityContainer.notLoading(K key) => const NewEntityContainer(status: EntityStatus.notLoading, entity: null);
  factory NewEntityContainer.loading(K key) => const NewEntityContainer(status: EntityStatus.loading, entity: null);
  factory NewEntityContainer.success(V entity) => NewEntityContainer(status: EntityStatus.success, entity: entity);

  NewEntityContainer<K,V> success(V entity) => NewEntityContainer(entity: entity, status: EntityStatus.success);
  NewEntityContainer<K,V> notFound() => NewEntityContainer(entity: entity, status: EntityStatus.notFound);
  NewEntityContainer<K,V> failed() => NewEntityContainer(entity: entity, status: EntityStatus.failed);

  bool get isSuccess => status == EntityStatus.success;
}