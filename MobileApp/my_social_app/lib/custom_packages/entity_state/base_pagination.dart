import 'package:my_social_app/custom_packages/entity_state/page.dart' as pagination;

abstract class BasePagination<K extends Comparable>{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  int get length;
  bool get isItemsEmpty;
  pagination.Page<K> get next;
  pagination.Page<K> get first => 
    pagination.Page<K>(
      offset: null,
      take: recordsPerPage,
      isDescending: isDescending
    );
  bool get hasAtLeastOnePage => length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;
  bool get isEmpty => isLast && isItemsEmpty;

  const BasePagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.recordsPerPage,
    required this.isDescending
  });
  
}