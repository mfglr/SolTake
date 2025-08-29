import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';

typedef Index<V extends Entity> = I Function<I extends Comparable>(V); 


class MultiIndexedCollection<V extends Entity>{
  final Iterable<Index<V>> indexes;
  final Map<Type,EntityCollection<Comparable, V>> _collections;
  MultiIndexedCollection({required this.indexes}) : 
    _collections = 
      Map<Type,EntityCollection<Comparable, V>>
        .fromIterable(indexes.map((index) => index()));
}