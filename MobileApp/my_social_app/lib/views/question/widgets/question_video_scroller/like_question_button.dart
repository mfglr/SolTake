import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';

class LikeQuestionButton extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  final double size;
  final Color color;
  const LikeQuestionButton({
    super.key,
    required this.container,
    this.size = 16,
    this.color = Colors.red
  });

  static const _loadException = {
    Languages.en: "You can't like a question that hasn't been loaded yet!",
    Languages.tr: "Henüz yüklenmeyen soruyu beğenemezsin!"
  };

  void _like(BuildContext context){
    if(container.isNotLoadSuccess){
      throw _loadException[getLanguage(context)]!;
    }

    var question = container.entity!;
    final store = StoreProvider.of<AppState>(context, listen: false);
    if(question.isLiked){
      store.dispatch(DislikeQuestionAction(question: question));
    }
    else{
      store.dispatch(LikeQuestionAction(question: question));
    }
  }

  @override
  Widget build(BuildContext context) {
    var question = container.entity!;
    return IconButton(
      onPressed: () => _like(context),
      icon: Icon(
        question.isLiked
          ? Icons.favorite
          : Icons.favorite_border,
        size: size,
        color: color,
      )
    );
  }
}