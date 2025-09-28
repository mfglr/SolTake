import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedias_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/medias_grid.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/create_prompt_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/extract_video_frame_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page_texts.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';

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
            onTap: (media){
              if(media.type == MultimediaType.video){
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => ExtractVideoFramePage(media: media)))
                  .then((value){
                    if(value != null && context.mounted){
                      // Navigator
                      //   .of(context)
                      //   .pop((
                      //     position: value.position,
                      //     blobName: media.blobName,
                      //     prompt: value.prompt,
                      //     isHighResulation: value.isHighResulation
                      //   ));
                    }
                  });
              }
              else{
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => CreatePromptPage(position: 0, media: media)))
                  .then((value){
                    if(value != null && context.mounted){
                      // Navigator
                      //   .of(context)
                      //   .pop((
                      //     position: null,
                      //     blobName: media.blobName,
                      //     prompt: value.prompt,
                      //     isHighResulation: value.isHighResulation
                      //   ));
                    }
                  });
              }
            },
          )
        ],
      ),
    );
  }
}