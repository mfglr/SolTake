import 'package:flutter/widgets.dart';
import 'package:my_social_app/custom_packages/media/pages/select_media_pagea/widgets/asset_entity_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetEntitiesWidget extends StatelessWidget {
  final Iterable<AssetEntity> entities;
  final bool Function(AssetEntity) isSelected;
  final void Function(AssetEntity) onPress;
  final void Function(AssetEntity) onLongPress;
  final int Function(AssetEntity) getSequence;

  const AssetEntitiesWidget({
    super.key,
    required this.entities,
    required this.isSelected,
    required this.onPress,
    required this.onLongPress,
    required this.getSequence
  });

  @override
  Widget build(BuildContext context) =>
    Wrap(
      children: entities
        .map(
          (entity) => Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.all(1),
            child: AssetEntityWidget(
              entity: entity,
              isSelected: isSelected(entity),
              onPress: onPress,
              onLongPress: onLongPress,
              getSequence: getSequence,
            ),
          )
        )
        .toList()
    );
}