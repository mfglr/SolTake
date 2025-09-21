import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/store.dart';

class QuestionLikeButton extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  final double? size;

  static const _loadException = {
    Languages.en: "You can’t like the question that is being uploaded.",
    Languages.tr: "Yüklenen soruyu beğenemezsin"
  };

  const QuestionLikeButton({
    super.key,
    required this.container,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    final question = container.entity!;
    return IconButton(
      onPressed: (){
        if(container.status != EntityStatus.loadSuccess){
          throw _loadException[getLanguage(context)]!;
        }
        
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