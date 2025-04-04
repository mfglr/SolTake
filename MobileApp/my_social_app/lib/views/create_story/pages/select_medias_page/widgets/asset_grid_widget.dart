import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetGridWidget extends StatefulWidget {
  final AssetEntity asset;
  final bool Function(AssetEntity) isSelected;
  final void Function(AssetEntity) onPressed;
  final void Function(AssetEntity) onLongPressed;

  const AssetGridWidget({
    super.key,
    required this.asset,
    required this.isSelected,
    required this.onPressed,
    required this.onLongPressed
  });

  @override
  State<AssetGridWidget> createState() => _AssetGridWidgetState();
}

class _AssetGridWidgetState extends State<AssetGridWidget> {

  Uint8List? image;

  @override
  void initState() {
    widget.asset.thumbnailData.then((list) => setState(() => image = list));
    super.initState();
  }

  Widget _generateMediaWidget() =>
      Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          image != null ? Image.memory(image!,fit: BoxFit.cover) : const LoadingCircleWidget(),
          if(widget.asset.type == AssetType.video)
            const Icon(
              Icons.play_circle_fill_rounded,
              color: Colors.white,
              size: 45,
            )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(widget.asset),
      onLongPress: () => widget.onLongPressed(widget.asset),
      child: widget.isSelected(widget.asset)
        ? Container(
            margin: const EdgeInsets.all(5),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _generateMediaWidget(),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.check_box_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                  )
                )
              ],
            ),
        )
        : _generateMediaWidget(),
    );
      
  }
}