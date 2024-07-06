import 'dart:collection';
import 'package:my_social_app/constants/records_per_page.dart';
import 'package:my_social_app/providers/user_state.dart';

class SearchState{
  String _key = "";
  String? _lastId;
  bool _isLastUsers = false;
  final List<String> _ids = [];

  String get key => _key;
  String? get lastId => _lastId;
  bool get isLastUsers => _isLastUsers;
  UnmodifiableListView<String> get ids => UnmodifiableListView(_ids);
  
  SearchState clone(){
    final state = SearchState();
    state._key = _key;
    state._lastId = _lastId;
    state._isLastUsers = _isLastUsers;
    state._ids.addAll(_ids);
    return state;
  }

  void init(String key, List<UserState> users){
    _key = key;
    _ids.clear();
    _isLastUsers = ids.length < recordsPerPage;
    _lastId = users.isNotEmpty ? users[users.length - 1].id : _lastId;
  }

  void next(List<String> ids){
    _ids.addAll(ids);
    _isLastUsers = ids.length < recordsPerPage;
    _lastId = ids.isNotEmpty ? ids[ids.length - 1] : _lastId;
  }

  void clear(){
    _ids.clear();
    _isLastUsers = false;
    _lastId = null;
  }
}