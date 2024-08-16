import 'package:flutter/material.dart';

@immutable
class EntityState<T extends dynamic> {
  final Map<int,T> entities;
  const EntityState({required this.entities});
 
  Map<int,T> appendOne(T value){
    if(this.entities[value.id] != null){
      return this.entities;
    }
    final Map<int,T> entities = {};
    entities.addAll(this.entities);
    entities.addEntries([MapEntry(value.id, value)]);
    return entities;
  }

  Map<int,T> appendMany(Iterable<T> values){
    final Map<int,T> entities = {};
    final notAvailables = values.where((e) => this.entities[e.id] == null);
    entities.addAll(this.entities);
    entities.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    return entities;
  }
  Map<int,T> appendLists(Iterable<Iterable<T>> lists){
    final Map<int,T> entities = {};
    entities.addAll(this.entities);
    for(final list in lists){
      var notAvailables = list.where((e) => this.entities[e.id] == null);
      entities.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    }
    return entities;
  }

  Map<int,T> appendManyAndUpdateOne(Iterable<T> values,T value){
    final Map<int,T> entities = {};
    final notAvailables = values.where((e) => this.entities[e.id] == null);
    entities.addAll(this.entities);
    entities.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    entities[value.id] = value;
    return entities;
  }
  

  Map<int,T> updateOne(T value){
    final Map<int,T> entities = {};
    entities.addAll(this.entities);
    entities[value.id] = value;
    return entities;
  }
  Map<int,T> updateMany(Iterable<T> values){
    final Map<int,T> entities = {};
    entities.addAll(this.entities);
    for(final value in values){
      entities[value.id] = value;
    }
    return entities;
  }
  Map<int,T> removeOne(int id){
    final Map<int,T> entities = {};
    entities.addAll(this.entities);
    entities.removeWhere((key,value) => key == id);
    return entities;
  }
}