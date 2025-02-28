abstract class BaseEntity<K extends Comparable> {
  final K id;
  BaseEntity({required this.id});
}