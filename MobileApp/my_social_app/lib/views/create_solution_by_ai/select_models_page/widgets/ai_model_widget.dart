import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page.dart';
// import 'package:my_social_app/views/create_solution_by_ai/select_models_page/widgets/sol_widget.dart';

class AiModelWidget extends StatelessWidget {
  final AIModelState aiModel;
  final QuestionState question;
  const AiModelWidget({
    super.key,
    required this.aiModel,
    required this.question
  });

 
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if(question.medias.isNotEmpty){
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => SelectMediaPage(questionId: question.id)))
            .then((value){
              if(value != null && context.mounted){
                Navigator
                  .of(context)
                  .pop((
                    modelId: aiModel.id,
                    blobName: value.blobName,
                    position: value.position,
                    prompt: value.prompt,
                    isHighResulation: value.isHighResulation
                  ));
              }
            });
        }
        else{
          Navigator
            .of(context)
            .pop((
              model: aiModel.id,
              blobName: null,
              position: null,
              prompt: question.content
            ));
        }
        
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    child: MultimediaGrid(
                      state: aiModel.image,
                      blobServiceUrl: AppClient.blobService,
                      noMediaPath: noMediaAssetPath,
                      notFoundMediaPath: noMediaAssetPath
                    ),
                  ),
                  Text(
                    aiModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           margin: const EdgeInsets.only(right: 5),
              //           child: const Icon(Icons.input)
              //         ),
              //         SolWidget(solPerToken: aiModel.solPerInputToken,),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Container(
              //           margin: const EdgeInsets.only(right: 5),
              //           child: const Icon(Icons.output)
              //         ),
              //         SolWidget(solPerToken: aiModel.solPerOutputToken,),
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}