import 'package:flutter/cupertino.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/widgets/selected_asset_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectedAssetsWidget extends StatelessWidget {
  final Iterable<AssetEntity> assets;
  final void Function(AssetEntity) removeSelectedAsset;

  const SelectedAssetsWidget({
    super.key,
    required this.assets,
    required this.removeSelectedAsset
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: assets
          .map(
            (asset) => Container(
              margin: const EdgeInsets.all(5),
              child: SelectedAssetWidget(
                asset: asset,
                removeSelectedAsset: removeSelectedAsset
              )
            )
          )
          .toList(),
      ),
    );
  }
}