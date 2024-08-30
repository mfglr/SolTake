import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/loading_state.dart';

@immutable
class EntityState<T extends Entity> {
  final Map<int,EntityContainer<T>> containers;
  const EntityState({required this.containers});
  
  Map<int,EntityContainer<T>> prependOne(T value){
    if(this.containers[value.id] != null) return this.containers;
    final Map<int,EntityContainer<T>> containers = {};
    containers[value.id] = EntityContainer(state: LoadingState.loaded, entity: value);
    containers.addAll(this.containers);
    return containers;
  }
  Map<int,EntityContainer<T>> appendOne(T value){
    if(this.containers[value.id] != null) return this.containers;
    final Map<int,EntityContainer<T>> containers = {};
    containers.addAll(this.containers);
    containers[value.id] = EntityContainer(state: LoadingState.loaded, entity: value);
    return containers;
  }

  Map<int,EntityContainer<T>> appendMany(Iterable<T> values){
    Map<int,EntityContainer<T>> containers = {};
    final notAvailables = values.where((e) => this.containers[e.id] == null);
    containers.addAll(this.containers);
    containers.addEntries(notAvailables.map((e) => MapEntry(e.id, EntityContainer(state: LoadingState.loaded,entity: e))));
    return containers;
  }
  Map<int,EntityContainer<T>> appendLists(Iterable<Iterable<T>> lists){
    Map<int,EntityContainer<T>> containers = {};
    containers.addAll(this.containers);
    for(final list in lists){
      var notAvailables = list.where((e) => this.containers[e.id] == null);
      containers.addEntries(notAvailables.map((e) => MapEntry(e.id, EntityContainer(state: LoadingState.loaded,entity: e))));
    }
    return containers;
  }

  Map<int,EntityContainer<T>> appendManyAndUpdateOne(Iterable<T> values,T value){
    final  Map<int,EntityContainer<T>> containers = {};
    final notAvailables = values.where((e) => this.containers[e.id] == null);
    containers.addAll(this.containers);
    containers.addEntries(notAvailables.map((e) => MapEntry(e.id, EntityContainer(state: LoadingState.loaded,entity: e))));
    containers[value.id] = EntityContainer(state: LoadingState.loaded,entity: value);
    return containers;
  }
  
  Map<int,EntityContainer<T>> updateOne(T? value){
    if(value == null) return this.containers;
    final Map<int,EntityContainer<T>> containers = {};
    containers.addAll(this.containers);
    containers[value.id] = EntityContainer(state: LoadingState.loaded,entity: value);
    return containers;
  }
  Map<int,EntityContainer<T>> updateMany(Iterable<T> values){
    Map<int,EntityContainer<T>> containers = {};
    containers.addAll(this.containers);
    containers.addEntries(values.map((e) => MapEntry(e.id, EntityContainer(state: LoadingState.loaded,entity: e))));
    return containers;
  }
  Map<int,EntityContainer<T>> removeOne(int id){
    final Map<int,EntityContainer<T>> containers = {};
    containers.addAll(this.containers);
    containers.removeWhere((key,value) => key == id);
    return containers;
  }
}