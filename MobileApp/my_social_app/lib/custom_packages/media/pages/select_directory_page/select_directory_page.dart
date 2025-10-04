import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/select_directory_page_texts.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/asset_path_entity_widget.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/camera_widget.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/local_medias_widget/local_medias_widget.dart';
import 'package:my_social_app/custom_packages/media/pages/select_media_pagea/select_media_page.dart';
import 'package:my_social_app/custom_packages/media/pages/take_media_page/take_media_page.dart';
import 'package:my_social_app/custom_packages/media/services/media_reader.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_slider.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/message/pages/create_message_medias_page/constants.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectDirectoryPage extends StatefulWidget {
  final int maxNumberOfMediax;
  final int maxDurationInSeconds;
  const SelectDirectoryPage({
    super.key,
    this.maxNumberOfMediax = 5,
    this.maxDurationInSeconds = 300
  });

  @override
  State<SelectDirectoryPage> createState() => _SelectDirectoryPageState();
}

class _SelectDirectoryPageState extends State<SelectDirectoryPage> {
  final ScrollController _controller = ScrollController();
  final int _numberOfColumn = 3;
  
  Iterable<LocalMedia> _medias = [];
  void _add(Iterable<LocalMedia> medias){
    final temp = [..._medias, ...medias];
    setState(() => _medias = temp.take(widget.maxNumberOfMediax));
    if(temp.length > widget.maxNumberOfMediax){
      throw getMaxMediaExceptionContent(numberOfMaxMessageMedia, getLanguage(context));
    }
    
  }
  void remove(LocalMedia media) => setState(() => _medias = _medias.where((e) => e != media));
  void selectDirectory(AssetPathEntity entity){
    if(_medias.length >= widget.maxNumberOfMediax){
      throw getMaxMediaExceptionContent(numberOfMaxMessageMedia, getLanguage(context));
    }
    Navigator
      .of(context)
      .push<Iterable<LocalMedia>?>(MaterialPageRoute(builder: (context) => SelectMediaPage(
        pathEntity: entity,
      )))
      .then((medias){
        if(medias != null && context.mounted){
          _add(medias);
        }
      });
  }
  void takeMedia(){
    if(_medias.length >= widget.maxNumberOfMediax){
      throw getMaxMediaExceptionContent(numberOfMaxMessageMedia, getLanguage(context));
    }
    Navigator
      .of(context)
      .push<LocalMedia>(MaterialPageRoute(builder: (context) => TakeMediaPage(maxDurationInSeconds: widget.maxDurationInSeconds,)))
      .then((media){
        if(media != null){
          _add([media]);
        }
      });
  }

  Iterable<AssetPathEntity> _entities = [];
  @override
  void initState() {
    MediaReader
      .getAssetPathEnties()
      .then((entities) => setState(() => _entities = entities));
    super.initState();
  }

  void previewMedia(int activeIndex) =>
    Navigator
      .of(context)
      .push(
        ModalBottomSheetRoute(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                ),
              ),
              Expanded(
                child: Center(
                  child: MediaSlider(
                    medias: _medias,
                    activeIndex: activeIndex,
                    blobService: "",
                  ),
                )
              ),
            ],
          ),
          isScrollControlled: true
        )
      ); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: title[getLanguage(context)]!),
        actions: [
          TextButton(
            onPressed: () => 
              Navigator
                .of(context)
                .pop<Iterable<LocalMedia>>(_medias),
            child: Text( confirmSelections[getLanguage(context)]!)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              controller: _controller,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    height: MediaQuery.of(context).size.width / _numberOfColumn,
                    width: MediaQuery.of(context).size.width / _numberOfColumn,
                    child: CameraWidget(
                      remove: remove,
                      onPressed: takeMedia,
                    )
                  ),
                  ..._entities
                    .map((e) => Container(
                      padding: const EdgeInsets.all(1),
                      height: MediaQuery.of(context).size.width / _numberOfColumn,
                      width: MediaQuery.of(context).size.width / _numberOfColumn,
                      child: AssetPathEntityWidget(
                        onpressed: () => selectDirectory(e),
                        pathEntity: e,
                      ),
                    ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8,left: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            selectedMedia[getLanguage(context)]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        if(_medias.isNotEmpty)
                          TextButton(
                            onPressed: () => previewMedia(0),
                            child: Text(
                              preview[getLanguage(context)]!,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: LocalMediasWidget(
                      medias: _medias,
                      numberOfColumn: 3,
                      remove: remove,
                      onPressed: previewMedia,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}