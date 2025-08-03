import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';

class NewEntityContainer<K extends Comparable, V extends Entity<K>> {
  final EntityStatus status;
  final V? entity;

  const NewEntityContainer({
    required this.status,
    required this.entity
  });

  factory NewEntityContainer.success(V entity) => NewEntityContainer(status: EntityStatus.success, entity: entity);
}