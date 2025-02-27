abstract class BaseEntity<K extends Comparable<K>> {
  final K id;
  BaseEntity({required this.id});
}