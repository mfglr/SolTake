import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_image.dart';
import 'package:my_social_app/media/models/local_media.dart';
import 'package:my_social_app/media/models/local_video.dart';
import 'package:my_social_app/media/pages/select_media_pagea/select_media_page_texts.dart';
import 'package:my_social_app/media/pages/select_media_pagea/widgets/asset_entities_widget.dart';
import 'package:my_social_app/scroll_controller_extentions/scroll_controller_extentions.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectMediaPage extends StatefulWidget {
  final AssetPathEntity pathEntity;
  const SelectMediaPage({
    super.key,
    required this.pathEntity,
  });

  @override
  State<SelectMediaPage> createState() => _SelectMediaPageState();
}

class _SelectMediaPageState extends State<SelectMediaPage> {
  final ScrollController _controller = ScrollController();
  Iterable<AssetEntity> _entities = [];
  final int _size = 8;
  int _page = 0;
  bool _isLast = false;
  bool _loading = false;
  Iterable<AssetEntity> _selectedEntities = [];
  bool isSelected(AssetEntity entity) => _selectedEntities.any((e) => e == entity);
  int getSequence(AssetEntity entity) => _selectedEntities.indexed.where((e) => e.$2 == entity).first.$1 + 1;
  void onPress(AssetEntity entity){
    if(isSelected(entity)){
      setState(() => _selectedEntities = _selectedEntities.where((e) => entity != e));
    }
    else{
      setState(() => _selectedEntities = [..._selectedEntities, entity]);
    }
  }
  void onLongPress(AssetEntity entity){
    if(!isSelected(entity)){
      setState(() => _selectedEntities = [..._selectedEntities, entity]);
    }
  }
  void _next(){
    if(!_loading && !_isLast){
      setState(() => _loading = true);
      widget.pathEntity
        .getAssetListPaged(page: _page, size: _size)
        .then((entities) => setState((){
          _entities = [..._entities, ...entities];
          _page++;
          _isLast = entities.length < _size;
          _loading = false;
        }));
    }
  }
  void _onScrollBottom() => _controller.onScrollBottom(_next);
 
  @override
  void initState() {
    _next();
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    super.dispose();
  }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: title[getLanguage(context)]!),
        actions: [
          TextButton(
            onPressed: () async {
              if(_selectedEntities.isEmpty){
                throw noMediaException[getLanguage(context)]!;
              }
              var list = <LocalMedia>[];
              for(var e in _selectedEntities){
                var file = await e.originFile;
                if(!context.mounted) return;
                if(file == null){
                  throw fileNotFoundException[getLanguage(context)]!;
                }
                if(e.type == AssetType.image){
                  list.add(LocalImage(file: file));
                }
                else{
                  list.add(LocalVideo(file: file));
                }
              }
              Navigator
                .of(context)
                .pop<Iterable<LocalMedia>>(list);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  confirmSelections[getLanguage(context)]!
                )
              ],
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            AssetEntitiesWidget(
              entities: _entities,
              isSelected: isSelected,
              onPress: onPress,
              onLongPress: onLongPress,
              getSequence: getSequence,
            ),
            if(_loading)
              const CircularProgressIndicator(
                strokeWidth: 4,
              ),
          ],
        ),
      ),
    );
  }
}