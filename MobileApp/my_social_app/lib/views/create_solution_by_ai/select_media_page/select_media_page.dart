import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_frame_page/extract_frame_page.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/medias_grid.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/create_prompt_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page_texts.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';

class SelectMediaPage extends StatelessWidget {
  final QuestionState question;
  const SelectMediaPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: title[getLanguage(context)]!)
      ),
      body: Column(
        children: [
          MediasGrid(
            medias: question.medias,
            numberOfColumn: 2,
            onTap: (media) async {
              Uint8List? bytes;
              if(media is RemoteVideo || media is LocalVideo){
                bytes = await Navigator
                  .of(context)
                  .push<Uint8List>(MaterialPageRoute(builder: (context) => ExtractFramePage(
                    media: media,
                    blobService: AppClient.blobService
                  )));
              }
              else if(media is LocalImage){
                bytes = await media.file.readAsBytes();
                  
              }
              else{
                var image = media as RemoteImage;
                bytes = await DefaultCacheManager()
                  .getSingleFile("${AppClient.blobService}/${image.containerName}/${image.blobName}")
                  .then((file) => file.readAsBytes());
              }

              if(bytes != null && context.mounted){
                Navigator
                  .of(context)
                  .push((MaterialPageRoute(builder: (context) => CreatePromptPage(bytes: bytes!))))
                  .then((value){
                    if(value != null && context.mounted){
                      Navigator.of(context).pop((prompt: value.prompt, bytes: bytes!));
                    }
                  });
              }
            }
          )
        ],
      ),
    );
  }
}