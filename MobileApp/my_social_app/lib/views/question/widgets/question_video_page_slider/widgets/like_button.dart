import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

class LikeButton extends StatelessWidget {
  final QuestionState question;
  const LikeButton({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
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
            return const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 35
            );
          }
          return const Icon(
            Icons.favorite_outline,
            color: Colors.white,
            size: 35,
          );
        }
      )
    );
  }
}