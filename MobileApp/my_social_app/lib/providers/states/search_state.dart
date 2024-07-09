import 'dart:collection';
import 'package:my_social_app/constants/records_per_page.dart';

class SearchState{
  String _key = "";
  int? _lastId;
  bool _isLastUsers = false;
  final List<int> _ids = [];

  String get key => _key;
  int? get lastId => _lastId;
  bool get isLastUsers => _isLastUsers;
  UnmodifiableListView<int> get ids => UnmodifiableListView(_ids);
  
  SearchState clone(){
    final state = SearchState();
    state._key = _key;
    state._lastId = _lastId;
    state._isLastUsers = _isLastUsers;
    state._ids.addAll(_ids);
    return state;
  }

  SearchState init(String key, List<int> ids){
    final state = clone();
    state._key = key;
    state._ids.clear();
    state._ids.addAll(ids);
    state._isLastUsers = ids.length < recordsPerPage;
    state._lastId = ids.isNotEmpty ? ids[ids.length - 1] : state._lastId;
    return state;
  }

  SearchState next(List<int> ids){
    final state = clone();
    state._ids.addAll(ids);
    state._isLastUsers = ids.length < recordsPerPage;
    state._lastId = ids.isNotEmpty ? ids[ids.length - 1] : state._lastId;
    return state;
  }

  SearchState clear() => SearchState();
}