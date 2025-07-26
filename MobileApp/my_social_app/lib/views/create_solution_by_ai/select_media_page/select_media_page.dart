import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia_grid/multimedias_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/create_prompt_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/extract_video_frame_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page_texts.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class SelectMediaPage extends StatelessWidget {
  final int questionId;
  const SelectMediaPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: questionId)),
      converter: (store) => store.state.questionEntityState.getValue(questionId),
      builder: (context,question) =>
        question == null
          ? const LoadingView()
          : Scaffold(
              appBar: AppBar(
                leading: const AppBackButtonWidget(),
                title: AppTitle(title: title[getLanguage(context)]!)
              ),
              body: Column(
                children: [
                  MultimediasGrid(
                    medias: question.medias,
                    blobServiceUrl: AppClient.blobService,
                    noMediaPath: noMediaAssetPath,
                    notFoundMediaPath: noMediaAssetPath,
                    onTap: (index){
                      var media = question.medias.elementAt(index);
                      if(media.multimediaType == MultimediaType.video){
                        Navigator
                          .of(context)
                          .push(MaterialPageRoute(builder: (context) => ExtractVideoFramePage(media: media)))
                          .then((value){
                            if(value != null && context.mounted){
                              Navigator
                                .of(context)
                                .pop((
                                  position: value.position,
                                  blobName: media.blobName,
                                  prompt: value.prompt,
                                  isHighResulation: value.isHighResulation
                                ));
                            }
                          });
                      }
                      else{
                        Navigator
                          .of(context)
                          .push(MaterialPageRoute(builder: (context) => CreatePromptPage(position: 0, media: media)))
                          .then((value){
                            if(value != null && context.mounted){
                              Navigator
                                .of(context)
                                .pop((
                                  position: null,
                                  blobName: media.blobName,
                                  prompt: value.prompt,
                                  isHighResulation: value.isHighResulation
                                ));
                            }
                          });
                      }
                    },
                  )
                ],
              ),
            ),
    );
  }
}