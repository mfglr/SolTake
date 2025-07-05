import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_user_complaint_service.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_item_popup_menu/question_item_popup_menu_constants.dart';
import 'package:my_social_app/views/question/pages/report_question_page/report_question_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

enum QuestionActions{
  delete,
  report
}

class QuestionItemPopupMenu extends StatelessWidget {
  final QuestionState question;
  const QuestionItemPopupMenu({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<QuestionActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) async {
        switch(value){
          case QuestionActions.delete:
            DialogCreator
              .showAppDialog(
                context,
                AppLocalizations.of(context)!.question_item_popup_menu_title,
                AppLocalizations.of(context)!.question_item_popup_menu_description,
                AppLocalizations.of(context)!.show_app_dialog_delete_button
              )
              .then((response){
                if(response && context.mounted){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(DeleteQuestionAction(questionId: question.id));
                }
              });
            case QuestionActions.report:
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => ReportQuestionPage(question: question)))
                .then((value){
                  if(value != null){
                    QuestionUserComplaintService
                      .create(question.id, value.reason, value.content)
                      .then((_){
                        if(!context.mounted) return;
                        ToastCreator.displaySuccess(reportCreatedMessage[getLanguage(context)]!);
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        // store.dispatch(DeleteHomeQuestionAction(id: question.id));
                        store.dispatch(RemoveUserQuestionAction(userId: question.userId, questionId: question.id));
                        store.dispatch(DeleteQuestionSuccessAction(questionId: question.id));
                      });
                  }
                });
            return;
        }
      },
      itemBuilder: (context) {
        return [
          if(question.isOwner)
            PopupMenuItem<QuestionActions>(
              value: QuestionActions.delete,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageWidget(
                    child: (language) => Text(
                      delete[language]!,
                      style: const TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              )
            ),
          if(!question.isOwner)
            PopupMenuItem<QuestionActions>(
              value: QuestionActions.report,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageWidget(
                    child: (language) => Text(
                      report[language]!,
                    ),
                  ),
                  const Icon(
                    Icons.report,
                  )
                ],
              )
            )
        ];
      }
    );
  }
}