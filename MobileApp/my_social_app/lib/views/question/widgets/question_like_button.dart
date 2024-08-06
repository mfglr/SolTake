import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/store.dart';

class QuestionLikeButton extends StatelessWidget {
  final QuestionState question;
  const QuestionLikeButton({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(question.isLiked){
          store.dispatch(DislikeQuestionAction(questionId: question.id));
        }
        else{
          store.dispatch(LikeQuestionAction(questionId: question.id));
        }
      },
      icon: Builder(
        builder: (context) {
          if(question.isLiked) return const Icon(Icons.favorite,color: Colors.red);
          return const Icon(Icons.favorite_outline);
        }
      )
    );
  }
}