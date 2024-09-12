import 'package:flutter/material.dart';

@immutable
class EntityState<T extends dynamic> {
  final Map<dynamic,T> entities;
  const EntityState({required this.entities});
  
  Map<dynamic,T> prependOne(T value){
    if(this.entities[value.id] != null) return this.entities;
    final Map<dynamic,T> entities = {};
    entities[value.id] = value;
    entities.addAll(this.entities);
    return entities;
  }
  Map<dynamic,T> appendOne(T value){
    if(this.entities[value.id] != null) return this.entities;
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    entities.addEntries([MapEntry(value.id, value)]);
    return entities;
  }
  Map<dynamic,T> appendMany(Iterable<T> values){
    final Map<dynamic,T> entities = {};
    final notAvailables = values.where((e) => this.entities[e.id] == null);
    entities.addAll(this.entities);
    entities.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    return entities;
  }
  Map<dynamic,T> appendLists(Iterable<Iterable<T>> lists){
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    for(final list in lists){
      var notAvailables = list.where((e) => this.entities[e.id] == null);
      entities.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    }
    return entities;
  }
  Map<dynamic,T> updateOne(T? value){
    if(value == null) return this.entities;
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    entities[value.id] = value;
    return entities;
  }
  Map<dynamic,T> updateMany(Iterable<T?> values){
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    for(final value in values){
      if(value != null) entities[value.id] = value;
    }
    return entities;
  }
  Map<dynamic,T> removeOne(int id){
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    entities.removeWhere((key,value) => key == id);
    return entities;
  }
  Map<dynamic,T> removeMany(Iterable<int> ids){
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities); 
    entities.removeWhere((key,value) => ids.any((id) => id == key));
    return entities;
  }
  Map<dynamic,T> removeLists(Iterable<Iterable<int>> lists){
    final Map<dynamic,T> entities = {};
    entities.addAll(this.entities);
    for(final list in lists){
      entities.removeWhere((key,e) => list.any((id) => id == key));
    }
    return entities;
  }
  Map<dynamic,T> where(bool Function(T) predicate){
    final Map<dynamic,T> entities = {};
    final values = this.entities.values.where(predicate);
    entities.addEntries(values.map((e) => MapEntry(e.id, e)));
    return entities;
  }
}