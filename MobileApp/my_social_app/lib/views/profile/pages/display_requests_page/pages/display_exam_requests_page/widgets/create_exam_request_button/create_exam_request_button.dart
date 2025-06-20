import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/views/create_exam/create_exam_page.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/create_exam_request_button/create_exam_request_button_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class CreateExamRequestButton extends StatelessWidget {
  const CreateExamRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateExamPage())),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5,),
            child: const FaIcon(FontAwesomeIcons.penToSquare),
          ),
          LanguageWidget(
            child: (language) => Text(
              requestToCreateExam[language]!
            )
          ),
        ],
      )
    );
  }
}