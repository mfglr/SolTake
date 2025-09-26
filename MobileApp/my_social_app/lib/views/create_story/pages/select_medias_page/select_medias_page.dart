import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/views/create_story/pages/create_story_page/create_story_page.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/select_medias_page_texts.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/widgets/asset_grid_widget.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/widgets/go_further_button/go_further_button.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/widgets/selected_assets_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:camera/camera.dart';
import 'package:take_media/pages/take_media_page.dart';

class SelectMediasPage extends StatefulWidget {
  const SelectMediasPage({super.key});

  @override
  State<SelectMediasPage> createState() => _SelectMediasPageState();
}

class _SelectMediasPageState extends State<SelectMediasPage> {
  final ScrollController _scrollController = ScrollController();
  static const _mediasPerPage = 10;
  int _offset = 0;
  bool _loading = false;
  bool _isLast = false;
  Iterable<AssetEntity> _assets = [];
  Iterable<AssetEntity> _selectedAssets = [];
  CameraController? _cameraController;
  
  void _onLongPressed(AssetEntity asset){
    if(!_isSelected(asset)){
      setState(() => _selectedAssets = [..._selectedAssets, asset]);
    }
  }

  void _onPressed(AssetEntity asset){
    setState(() {
      if(_selectedAssets.isNotEmpty){
        if(_isSelected(asset)){
          _selectedAssets = _selectedAssets.where((e) => e != asset);
        }
        else{
          _selectedAssets = [..._selectedAssets, asset];
        }
      }
      else{
        asset.file.then((file){
          if(!mounted) return;
          var appFiles = [asset.type == AssetType.video ? AppFile.video(XFile(file!.path)) : AppFile.image(XFile(file!.path))];
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => CreateStoryPage(appFiles: appFiles)))
            .then((appFiles){
              if(appFiles == null || !mounted) return;
              Navigator.of(context).pop(appFiles);
            });
        });
      }
    });
  }

  void _removeSelectedAsset(AssetEntity asset){
    setState(() {
      _selectedAssets = _selectedAssets.where((e) => e != asset);
    });
  }

  bool _isSelected(AssetEntity asset) => _selectedAssets.any((e) => e == asset);

  void _getNext(){
    if(!_loading && !_isLast){
      _loading = true;
      PhotoManager
      .requestPermissionExtend()
      .then((e){
        if(e.isAuth){
          PhotoManager
            .getAssetPathList(
              type: RequestType.fromTypes([RequestType.image,RequestType.video]),
              onlyAll: true
            )
            .then((e){
              if(e.firstOrNull != null){
                e.first
                  .getAssetListRange(start: _offset, end: _offset + _mediasPerPage)
                  .then((list){
                    setState(() {
                      _assets = [..._assets, ...list];
                      _loading = false;
                      _isLast = list.length != _mediasPerPage;
                      _offset += list.length;
                    });
                  });
              }
            });
        }
      });
    }
  }

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    _getNext
  );

  @override
  void initState() {
    availableCameras()
      .then((e) => setState((){
        _cameraController = CameraController(e.first, ResolutionPreset.max);
        _cameraController!
          .initialize()
          .then((_) => setState(() {}));
      }));

    _scrollController.addListener(_onScrollBottom);
    _getNext();
    super.initState();
  }
  
  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          )
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GridView(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2
            ),
            children: [
              if(_cameraController != null)
                CameraPreview(
                  _cameraController!,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () 
                          => 
                            Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (context) => const TakeMediaPage()))
                              .then((appFile){
                                if(appFile != null && context.mounted){
                                  Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder: (context) => CreateStoryPage(appFiles: [appFile as AppFile])))
                                    .then((appFiles){
                                      if(appFiles == null || !context.mounted) return;
                                      Navigator.of(context).pop(appFiles);
                                    });
                                }
                              }),
                        icon: const Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                          size: 45,
                        )
                      )
                    ],
                  ),
                ),
              ..._assets.map(
                (asset) => AssetGridWidget(
                  asset: asset,
                  isSelected: _isSelected,
                  onPressed: _onPressed,
                  onLongPressed: _onLongPressed,
                )
              ),
              if(_loading)
                const LoadingCircleWidget()
            ]
          ),
          if(_selectedAssets.isNotEmpty) 
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(155),
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SelectedAssetsWidget(
                      assets: _selectedAssets,
                      removeSelectedAsset: _removeSelectedAsset,
                    ),
                  ),
                  GoFurtherButton(assets: _selectedAssets,),
                ]
              ),
            )
        ],
      ),
    );
  }
}