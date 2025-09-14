import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_request_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_subject/select_exam_page/select_exam_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'create_subject_button_constants.dart';

class CreateSubjectButton extends StatelessWidget {
  final ExamState? exam;
  const CreateSubjectButton({
    super.key,
    required this.exam
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const SelectExamPage()))
          .then((value){
            if(value != null && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(CreateSubjectRequestAction(exam: value.exam, name: value.name));
              ToastCreator.displaySuccess(message[getLanguage(context)]!);
            }
          }),

      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const FaIcon(FontAwesomeIcons.book)
          ),
          LanguageWidget(
            child: (language) => Text(
              content[language]!
            )
          )
        ],
      )
    );
  }
}