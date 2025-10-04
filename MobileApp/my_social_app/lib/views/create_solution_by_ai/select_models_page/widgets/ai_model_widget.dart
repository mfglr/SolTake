import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/ai_model_state/ai_model_state.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page.dart';

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
            .push(MaterialPageRoute(builder: (context) => SelectMediaPage(question: question)))
            .then((value){
              if(value != null && context.mounted){
                Navigator
                  .of(context)
                  .pop((
                    aiModel: aiModel,
                    prompt: value.prompt,
                    bytes: value.bytes
                  ));
              }
            });
        }
        else{
          Navigator
            .of(context)
            .pop((
              aiModel: aiModel,
              bytes: null,
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
                    child: MediaFrameWidget(
                      media: aiModel.image,
                      blobService: AppClient.blobService,
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