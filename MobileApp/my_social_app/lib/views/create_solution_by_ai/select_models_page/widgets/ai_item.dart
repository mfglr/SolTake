import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_media_page/select_media_page.dart';

class AiItem extends StatelessWidget {
  final String model;
  final QuestionState question;
  const AiItem({
    super.key,
    required this.model,
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
                    model: model,
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
              model: model,
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
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  "assets/images/$model.jpg",
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  fit: BoxFit.cover,
                ),
              ),
              Text(model)
            ],
          ),
        ),
      ),
    );
  }
}