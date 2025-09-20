import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/base_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart' as pagination;

@immutable
class ContainerPagination<K extends Comparable, E extends Entity<K>> extends BasePagination<K>{
  final Iterable<EntityContainer<K, E>> containers;
  @override
  bool get isItemsEmpty => containers.isEmpty;
  @override
  int get length => containers.length;
  @override
  pagination.Page<K> get next => 
    pagination.Page<K>(
      offset: containers.map((e) => e.key).lastOrNull,
      take: recordsPerPage,
      isDescending: isDescending
    );
  
  const ContainerPagination._({
    required super.isLast,
    required super.loadingNext,
    required super.loadingPrev,
    required super.recordsPerPage,
    required super.isDescending,
    required this.containers
  });

  factory ContainerPagination.fromCollection(EntityCollection<K,E> collection, KeyPagination<K> keyPagination) =>
    ContainerPagination<K,E>._(
      isLast: keyPagination.isLast,
      loadingNext: keyPagination.loadingNext,
      loadingPrev: keyPagination.loadingPrev,
      recordsPerPage: keyPagination.recordsPerPage,
      isDescending: keyPagination.isDescending,
      containers: keyPagination.keys.map((key) => collection[key]) 
    );
  
}