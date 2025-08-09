abstract class BasePagination {
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  int get length;
  bool get isItemsEmpty;

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