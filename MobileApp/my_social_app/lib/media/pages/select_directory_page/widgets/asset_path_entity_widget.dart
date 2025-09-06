import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetPathEntityWidget extends StatefulWidget {
  final AssetPathEntity pathEntity;
  final void Function() onpressed;

  const AssetPathEntityWidget({
    super.key,
    required this.pathEntity,
    required this.onpressed
  });

  @override
  State<AssetPathEntityWidget> createState() => _AssetPathEntityWidgetState();
}

class _AssetPathEntityWidgetState extends State<AssetPathEntityWidget> {
  Uint8List? _bytes;
  int _numberOfMedias = 0;

  @override
  void initState() {
    widget.pathEntity
      .getAssetListRange(start: 0, end: 1)
      .then((e) => e.first.thumbnailData)
      .then((list) => setState(() => _bytes = list));

    widget.pathEntity
      .assetCountAsync
      .then((number) => setState(() => _numberOfMedias = number));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if(_bytes != null)
              Image.memory(
                _bytes!,
                fit: BoxFit.cover,
                height: constraints.constrainWidth(),
                width: constraints.constrainWidth(),
              )
            else
              const CircularProgressIndicator(
                strokeWidth: 4,
              ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(128),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.pathEntity.name,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    _numberOfMedias.toString(),
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}