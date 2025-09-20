import 'package:flutter/material.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';

class QuestionAbstractLoadFailedWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  const QuestionAbstractLoadFailedWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_loadingFailed[getLanguage(context)]!),
        const Icon(Icons.close)
      ],
    );
  }
}


const _loadingFailed = {
  Languages.en: "Loading failed!",
  Languages.tr: "Yükleme Başarısız"
};