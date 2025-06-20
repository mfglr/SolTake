import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/get_language.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';
import 'package:soltake_broker/utilities/toast_creator.dart';
import 'package:soltake_broker/views/requests_page/pages/widgets/reject_exam_request_button/reject_exam_request_button_constants.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

class RejectExamRequestButton extends StatefulWidget {
  final ExamRequestState examRequest;
  const RejectExamRequestButton({
    super.key,
    required this.examRequest
  });

  @override
  State<RejectExamRequestButton> createState() => _RejectExamRequestButtonState();
}

class _RejectExamRequestButtonState extends State<RejectExamRequestButton> {
  int _reason = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        LanguageWidget(
          child: (language) => DropdownMenu<String>(
            initialSelection: reasons.first[language],
            onSelected: (value) => _reason = reasons.indexed.firstWhere((e) => e.$2[language] == value).$1,
            dropdownMenuEntries: reasons.map(
              (e) => DropdownMenuEntry<String>(
                value: e[language]!,
                label: e[language]!
              )
            ).toList(),
          ),
        ),

        IconButton(
          onPressed: (){
            if(_reason == 0){
              ToastCreator.displayError(reasonNotSelectedErrorMessage[getLanguage(context)]!);
              return;
            }
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(RejectExamRequestAction(id: widget.examRequest.id, reason: _reason));
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          )
        ),

      ],
    );
  }
}