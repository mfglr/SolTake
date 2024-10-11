import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

@immutable
class UserSearchEntityState extends EntityState<UserSearchState>{
  const UserSearchEntityState({required super.entities});

  UserSearchEntityState addSearchs(Iterable<UserSearchState> searchs)
    => UserSearchEntityState(entities: appendMany(searchs));
  UserSearchEntityState addSearch(UserSearchState search)
    => UserSearchEntityState(entities: appendOne(search));
  UserSearchEntityState removeSearch(int searchId)
    => UserSearchEntityState(entities: removeOne(searchId));

  UserSearchState? select(int searcherId, int searchedId)
    => entities.values.firstWhereOrNull((e) => e.searcherId == searcherId && e.searchedId == searchedId);
}