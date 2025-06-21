import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_request_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_subject/select_exam_page/select_exam_page.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/create_subject_button/create_subject_request_button_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class CreateSubjectRequestButton extends StatelessWidget {
  const CreateSubjectRequestButton({super.key});

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5,),
            child: const FaIcon(FontAwesomeIcons.book),
          ),
          LanguageWidget(
            child: (language) => Text(
              requestToCreateSubject[language]!
            )
          ),
        ],
      )
    );
  }
}