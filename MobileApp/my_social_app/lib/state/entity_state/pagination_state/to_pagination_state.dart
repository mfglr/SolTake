import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

Pagination<K,V> toPaginationState<K extends Comparable, V extends Entity<K>>(EntityState<K,V> entityState, KeyPagination<K> keyPagination)
  => Pagination(
      isLast: keyPagination.isLast,
      loadingNext: keyPagination.loadingNext,
      loadingPrev: keyPagination.loadingPrev,
      isDescending: keyPagination.isDescending,
      recordsPerPage: keyPagination.recordsPerPage,
      values: entityState.getByKeys(keyPagination.values)
    );