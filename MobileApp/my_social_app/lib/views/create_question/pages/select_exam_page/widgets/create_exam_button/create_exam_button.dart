import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_exam/create_exam_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_exam_button_texts.dart';

class CreateExamButton extends StatelessWidget {
  const CreateExamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const CreateExamPage()))
          .then((value){
            if(value != null && value == true && context.mounted){
              ToastCreator.displaySuccess(message[getLanguage(context)]!);
            }
          }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5,),
            child: const FaIcon(FontAwesomeIcons.penToSquare),
          ),
          LanguageWidget(
            child: (language) => Text(
              content[language]!
            )
          ),
        ],
      )
    );
  }
}