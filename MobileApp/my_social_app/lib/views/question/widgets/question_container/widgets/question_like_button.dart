import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/store.dart';

class QuestionLikeButton extends StatelessWidget {
  final QuestionState<int> question;
  final double? size;
  const QuestionLikeButton({
    super.key,
    required this.question,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(question.isLiked){
          store.dispatch(DislikeQuestionAction(question: question));
        }
        else{
          store.dispatch(LikeQuestionAction(question: question));
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Builder(
        builder: (context) {
          if(question.isLiked){
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: size,
            );
          }
          return Icon(
            Icons.favorite_outline,
            color: Colors.red,
            size: size,
          );
        }
      )
    );
  }
}