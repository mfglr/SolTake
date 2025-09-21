import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/display_question_abstract_solutions_page.dart';

class DisplaySolutionsButton extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  const DisplaySolutionsButton({super.key,required this.container});

  static const _loadException = {
    Languages.en: "You can’t solve the question that is being uploaded.",
    Languages.tr: "Yüklenen soruyu çözemezsin."
  };

  @override
  Widget build(BuildContext context) {
    final question = container.entity!;
    return TextButton(
      onPressed: (){
        if(container.status != EntityStatus.loadSuccess){
          throw _loadException[getLanguage(context)]!;
        }
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplayQuestionAbstractSolutionsPage(
                questionId: container.key
              )
            )
          );
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.border_color),
          ),
          Text(question.numberOfSolutions.toString())
        ],
      )
    );
  }
}