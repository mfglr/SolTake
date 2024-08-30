import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/search_state/user_search_state.dart';

@immutable
class UserSearchEntityState extends EntityState<UserSearchState>{
  const UserSearchEntityState({required super.containers});

  UserSearchEntityState addSearchs(Iterable<UserSearchState> searchs)
    => UserSearchEntityState(containers: appendMany(searchs));
  UserSearchEntityState addSearch(UserSearchState search)
    => UserSearchEntityState(containers: appendOne(search));
  UserSearchEntityState removeSearch(int searchId)
    => UserSearchEntityState(containers: removeOne(searchId));

  UserSearchState? select(int searcherId, int searchedId)
    => containers.values.firstWhereOrNull((e) => e.entity.searcherId == searcherId && e.entity.searchedId == searchedId)?.entity;
}