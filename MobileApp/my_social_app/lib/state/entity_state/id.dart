import 'package:my_social_app/state/entity_state/has_id.dart';

class Id<K extends Comparable<K>> extends HasId<K>{
  Id({required super.id});
}