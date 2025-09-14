import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_requests_state/actions.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/create_topic/select_subject_page/select_subject_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'create_topic_request_button_constants.dart';

class CreateTopicRequestButton extends StatelessWidget {
  const CreateTopicRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () =>
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const SelectSubjectPage()))
          .then((value){
            if(value != null && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(CreateTopicRequestAction(subject: value.subject, name: value.name));
              ToastCreator.displaySuccess(message[getLanguage(context)]!);
            }
          }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const FaIcon(FontAwesomeIcons.list),
          ),
          LanguageWidget(
            child: (language) => Text(
              content[language]!
            ),
          )
        ],
      )
    );
  }
}