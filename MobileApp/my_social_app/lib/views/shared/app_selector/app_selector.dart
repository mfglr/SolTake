import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/views/shared/app_selector/overlay_content.dart';
import 'package:my_social_app/state/entity_state/page.dart' as pagination;

class AppSelector<K extends Comparable, V extends Entity<K>> extends StatefulWidget {
  final String hintText;
  final Widget Function(V item, void Function(V item) seletItem) itemBuilder;
  final bool showSearchField;
  final InputDecoration? decoration;
  final bool isDescending;
  final int recordPerpage;
  final Future<Iterable<V>> Function(String? key, pagination.Page<K> page) calback;
  final Widget Function(V item,void Function(V item) removeItem) selectedItemsBuilder;

  const AppSelector({
    super.key,
    required this.hintText,
    required this.itemBuilder,
    required this.isDescending,
    required this.recordPerpage,
    required this.calback,
    required this.selectedItemsBuilder,
    this.showSearchField = false,
    this.decoration
  });

  @override
  State<AppSelector<K,V>> createState() => _AppSelectorState<K,V>();
}

class _AppSelectorState<K extends Comparable, V extends Entity<K>> extends State<AppSelector<K,V>> {
  final GlobalKey _key = GlobalKey();
  late OverlayEntry _entry;
  bool _isActive = false;
  late double _top;
  late double _left;
  late double _width;

  List<V> _selectedItems = [];

  void _getWidgetInfo() {
    final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    _top = position.dy + renderBox.size.height;
    _left = position.dx;
    _width = renderBox.size.width;
  }

  void _selectItem(V value){
    setState(() => _selectedItems = [..._selectedItems, value]);
    _entry.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWidgetInfo();
      _entry = _buildOverlayEntry();
      Overlay.of(context).insert(_entry);
    });
  }

  void _removeItem(V value){
    setState(() => _selectedItems = _selectedItems.where((item) => item != value).toList());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWidgetInfo();
      _entry = _buildOverlayEntry();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
     _getWidgetInfo();
     _entry = _buildOverlayEntry();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
 
  void _showOverlay(BuildContext context){
    Overlay.of(context).insert(_entry);
    setState(() => _isActive = true);
  }
  void _removeOverlay(){
    _entry.remove();
    setState(() => _isActive = false);
  } 
  
  OverlayEntry _buildOverlayEntry() => 
    OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.opaque,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: Material(
              elevation: 4,
              child: Container(
                width: _width,
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.white,
                child: OverlayContent<K,V>(
                  selectItem: _selectItem,
                  isDescending: widget.isDescending,
                  recordsPerPage: widget.recordPerpage,
                  itemBuilder: widget.itemBuilder,
                  decoration: widget.decoration,
                  showSearchField: widget.showSearchField,
                  calback: widget.calback
                ),
              ),
            ),
          )
        ],
      ),
    );
  
  

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _key,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_selectedItems.isEmpty)
              TextButton(
                onPressed: () => _showOverlay(context),
                child: Text(
                  widget.hintText,
                ),
              ),
            if(_selectedItems.isNotEmpty)
              Expanded(
                child: Column(
                  children: _selectedItems.map((item) => widget.selectedItemsBuilder(item, _removeItem)).toList(),
                ) 
              )
          ],
        ),
        Container(
          height: _isActive ? 3 : 1,
          color: _isActive
            ? const Color.fromARGB(255, 104, 84, 142)
            : const Color.fromARGB(255, 122, 117, 127)
        ),
        if(!_isActive)
          Container(
            height: 1,
            color: const Color.fromARGB(255, 237, 230, 239),
          ),
        if(!_isActive)
          Container(
            height: 1,
            color: Colors.white,
          ),
      ],
    );
  }
}