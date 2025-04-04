import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/create_story/pages/create_story_page/create_story_page.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/widgets/go_further_button/go_further_button_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class GoFurtherButton extends StatelessWidget {
  final Iterable<AssetEntity> assets;
  const GoFurtherButton({
    super.key,
    required this.assets
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => 
        assets
          .map(
            (asset) => asset.file
              .then((file) => asset.type == AssetType.video ? AppFile.video(XFile(file!.path)) : AppFile.image(XFile(file!.path)))
          )
          .wait
          .then((appFiles){
            if(!context.mounted) return;
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => CreateStoryPage(appFiles: appFiles,)));
          }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:[
          LanguageWidget(
            child: (language) => Text(createStory[language]!) 
          ),
          const Icon(Icons.navigate_next_rounded)
        ]
      )
    );
  }
}