import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetEntityWidget extends StatefulWidget {
  final AssetEntity entity;
  final void Function(AssetEntity) onPress;
  final void Function(AssetEntity) onLongPress;
  final int Function(AssetEntity) getSequence;

  final bool isSelected;
  const AssetEntityWidget({
    super.key,
    required this.entity,
    required this.isSelected,
    required this.onPress,
    required this.onLongPress,
    required this.getSequence
  });

  @override
  State<AssetEntityWidget> createState() => _AssetEntityWidgetState();
}

class _AssetEntityWidgetState extends State<AssetEntityWidget> {
  Uint8List? _bytes;

  @override
  void initState() {
    widget.entity
      .thumbnailData
      .then((bytes) => setState(() =>_bytes = bytes));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPress(widget.entity),
      onLongPress: () => widget.onLongPress(widget.entity),
      child: Container(
        margin: EdgeInsets.all(widget.isSelected ? 4 : 0),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Stack(
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
                  if(widget.entity.type == AssetType.video)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withAlpha(128),
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                ],
              ),
              if(widget.isSelected)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(128),
                    shape: BoxShape.circle
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      Text(
                        widget.getSequence(widget.entity).toString(),
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
      ),
    );
  }
}