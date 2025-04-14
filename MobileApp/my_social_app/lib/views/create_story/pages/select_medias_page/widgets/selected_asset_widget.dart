import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:badges/badges.dart' as badges;

class SelectedAssetWidget extends StatefulWidget {
  final AssetEntity asset;
  final void Function(AssetEntity) removeSelectedAsset;
  
  const SelectedAssetWidget({
    super.key,
    required this.asset,
    required this.removeSelectedAsset
  });

  @override
  State<SelectedAssetWidget> createState() => _SelectedAssetWidgetState();
}

class _SelectedAssetWidgetState extends State<SelectedAssetWidget> {
  Uint8List? image;

  @override
  void initState() {
    widget.asset.thumbnailData.then((list) => setState(() => image = list));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.white,
      ),
      badgeContent: IconButton(
        onPressed: () => widget.removeSelectedAsset(widget.asset),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: const Icon(
          Icons.close,
          size: 15,
        ),
      ),
      child: SizedBox(
        height: 50,
        width: 50,
        child: image != null ? Image.memory(image!, fit: BoxFit.cover) : Container(color: Colors.grey)
      ),
    );
    
  }
}