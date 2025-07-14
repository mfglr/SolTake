import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/entity_state/page.dart' as page;
import 'package:my_social_app/state/entity_state/pagination_widget/paginable.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class PaginationWidget<K extends Comparable, V extends Paginable<K>> extends StatefulWidget {
  final int perPage;
  final bool isDescending;
  final Future<Iterable<V>> Function(page.Page<K> page, {dynamic parameters}) callback;
  final dynamic parameters;
  final Iterable<V> items;
  final Widget Function(V) itemBuilder;
  final Widget? noItems;
  final void Function(Iterable<V> items) onNextSuccess;
  final void Function(Iterable<V> items)? onRefreshSuccess;
  
  const PaginationWidget({
    super.key,
    required this.callback,
    required this.isDescending,
    required this.perPage,
    required this.items,
    required this.onNextSuccess,
    this.onRefreshSuccess,
    required this.itemBuilder,
    this.noItems,
    this.parameters,
  });

  @override
  State<PaginationWidget<K,V>> createState() => _PaginationWidgetState<K,V>();
}

class _PaginationWidgetState<K extends Comparable, V extends Paginable<K>> extends State<PaginationWidget<K,V>> {
  final ScrollController _scrollController = ScrollController();
  bool _loadingNext = false;
  bool _isLast = false;
  bool get _isReadyForNext => !_isLast && !_loadingNext;
  bool get _isEmpty => _isLast && widget.items.isEmpty;
  bool get _hasAtLeastOnePage => widget.items.length >= widget.perPage && !_loadingNext;
  page.Page<K> get _selectNextPage =>
    page.Page<K>(
      offset: widget.items.lastOrNull?.paginationProperty,
      isDescending: widget.isDescending,
      take: widget.perPage
    );
  page.Page<K> get _firstPage =>
    page.Page<K>(
      offset: null,
      take: widget.perPage,
      isDescending: widget.isDescending
    );

  Future<void> _get(){
    setState(() => _loadingNext = true);
    return widget
      .callback(_selectNextPage, parameters: widget.parameters)
      .then((items){
        widget.onNextSuccess(items);
        setState((){
          _isLast = items.length < widget.perPage;
          _loadingNext = false;
        });
      })
      .catchError((e){
        setState(() => _loadingNext = false);
        throw e;
      });
  }
  Future<void> _refresh(){
    setState(() => _loadingNext = true);
    return widget
      .callback(_firstPage, parameters: widget.parameters)
      .then((items){
        widget.onRefreshSuccess!(items);
        setState((){
          _isLast = items.length < widget.perPage;
          _loadingNext = false;
        });
      })
      .catchError((e){
        setState(() => _loadingNext = false);
        throw e;
      });
  }
  void _nextIfNoPage(){
    if(!_hasAtLeastOnePage){
      _get();
    }
  }
  void _nextIfReady(){
    if(_isReadyForNext){
      _get();
    }
  }

  void _onScrollBottom() => onScrollBottom(_scrollController,_nextIfReady);

  @override
  void initState() {
    _nextIfNoPage();
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _build() => SingleChildScrollView(
    controller: _scrollController,
    child: Column(
      children: [
        if(_isEmpty && widget.noItems != null)
          widget.noItems!
        else
          ...widget.items.map((item) => widget.itemBuilder(item)),
        if(_loadingNext)
          const LoadingCircleWidget()
      ]
    ),
  );


  @override
  Widget build(BuildContext context) {
    return widget.onRefreshSuccess != null
      ? RefreshIndicator(
          onRefresh: (){
            if(!_loadingNext){
              return _refresh();
            }
            return Future.value();
          },
          child: _build()
        )
      : _build();
  }
}