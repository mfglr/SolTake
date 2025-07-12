import 'package:test_app/state/entity_state/pagination_state/pagination.dart';

abstract class PaginationState{
  Pagination selectPagination(String context);  
}