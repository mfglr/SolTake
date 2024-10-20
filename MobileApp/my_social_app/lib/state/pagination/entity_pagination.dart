import 'package:my_social_app/state/pagination/map_extentions.dart';
import 'package:my_social_app/state/pagination/page.dart';

class EntityPagination<T extends dynamic>{
  final Map<int,T> entities;
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;

  const EntityPagination({
    required this.entities,
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.recordsPerPage,
    required this.isDescending
  });

  factory EntityPagination.init(int recordsPerPage,bool isDescending) 
    => EntityPagination(
        entities: {},
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        recordsPerPage: recordsPerPage,
        isDescending: isDescending
      );

  EntityPagination<T> _optinal({
    Map<int,T>? newEntities,
    bool? newIsLast,
    bool? newLoadingNext,
    bool? newLoadingPrev
  }) => EntityPagination(
    entities: newEntities ?? entities,
    isLast: newIsLast ?? isLast,
    loadingNext: newLoadingNext ?? loadingNext,
    loadingPrev: newLoadingPrev ?? loadingPrev,
    recordsPerPage: recordsPerPage,
    isDescending: isDescending
  );

  Page get prev => 
    Page(
      offset: entities.values.firstOrNull?.id ?? 2147483647,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  Page get next =>
    Page(
      offset:  entities.values.lastOrNull?.id ?? 2147483647,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => entities.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;

  EntityPagination<T> prependOne(T entity)
    => _optinal(newEntities: entities.prependOne(entity));
  EntityPagination<T> appendOne(T entity)
    => _optinal(newEntities: entities.appendOne(entity));

  EntityPagination<T> prependMany(Iterable<T> entities)
    => _optinal(newEntities: this.entities.prependMany(entities));
  EntityPagination<T> appendMany(Iterable<T> entities)
    => _optinal(newEntities: this.entities.appendMany(entities));

  EntityPagination<T> startLoadingPrev()
    => _optinal(newLoadingPrev: true);
  EntityPagination<T> addPrevPage(Iterable<T> entities)
    => _optinal(
        newEntities: this.entities.prependMany(entities),
        newLoadingPrev: false
      );

  EntityPagination<T> startLoadingNext()
    => _optinal(newLoadingNext: true);
  EntityPagination<T> stopLoadingNext()
    => _optinal(newLoadingNext: false);
  EntityPagination<T> addNextPage(Iterable<T> entities)
    => _optinal(
      newIsLast: entities.length < recordsPerPage,
      newEntities: this.entities.appendMany(entities),
      newLoadingNext: false
    );

  EntityPagination<T> updateOne(T entity)
    => _optinal(newEntities: entities.updateOne(entity));
  EntityPagination<T> updateMany(Iterable<T> entities)
    => _optinal(newEntities: this.entities.updateMany(entities));

  EntityPagination<T> removeOne(int id)
    => _optinal(newEntities: entities.removeOne(id));
  EntityPagination<T> removeMany(Iterable<int> ids)
    => _optinal(newEntities: entities.removeMany(ids));
}