import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:my_social_app/state/entity_state/page.dart' as pagination;

class OverlayContent<K extends Comparable, V extends Entity<K>> extends StatefulWidget {
  final Widget Function(V item, void Function(V item) selectItem) itemBuilder;
  final bool showSearchField;
  final InputDecoration? decoration;
  final int recordsPerPage;
  final bool isDescending;
  final Future<Iterable<V>> Function(String? key, pagination.Page<K> page) calback;
  final void Function(V item) selectItem;

  const OverlayContent({
    super.key,
    required this.itemBuilder,
    required this.isDescending,
    required this.recordsPerPage,
    required this.selectItem,
    required this.calback,
    this.showSearchField = false,
    this.decoration
  });

  @override
  State<OverlayContent<K,V>> createState() => _OverlayContentState<K,V>();
}

class _OverlayContentState<K extends Comparable, V extends Entity<K>> extends State<OverlayContent<K,V>> {
  late Pagination<K,V> _pagination;
  final _scrollController = ScrollController();
  String? _searchKey; 
  final _subject = BehaviorSubject<String>();
  late final StreamSubscription<String> _subscriber;

  void _next(String? key){
    if(_pagination.isReadyForNextPage){
      setState(() => _pagination = _pagination.startLoadingNext());
        widget
          .calback(key, _pagination.next)
          .then((items) => setState(() => _pagination = _pagination.addNextPage(items)))
          .catchError((e){
            setState(() => _pagination = _pagination.stopLoadingNext());
            throw e;
          });
    }
  }

  void _search(String? key){
    if(!_pagination.loadingNext){
      setState(() => _pagination = _pagination.startLoadingNext());
      widget
        .calback(key, _pagination.first)
        .then((exams) => setState(() => _pagination = _pagination.addfirstPage(exams)))
        .catchError((e){
          setState(() => _pagination = _pagination.stopLoadingNext());
          throw e;
        });
    }
  }

  @override
  void initState() {
    _pagination = Pagination.init(widget.recordsPerPage, widget.isDescending);

    _next("");

    _scrollController.addListener(_onScrollBottom);

    _subscriber = _subject
      .debounceTime(const Duration(milliseconds: 300))
      .distinct()
      .listen(_search);
    
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    _subscriber.cancel();
    super.dispose();
  }

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    () => _next(_searchKey)
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.showSearchField)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: widget.decoration,
              onChanged: (key){
                _subject.add(key);
                setState(() => _searchKey = key);
              }
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child:
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 3 + 1,
              ),
              child: Column(
                children:
                  [
                    ..._pagination.values
                    .map(
                      (item) => widget.itemBuilder(item,widget.selectItem)
                    ),
                    _pagination.loadingNext ? const LoadingCircleWidget() : const SpaceSavingWidget()
                  ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}