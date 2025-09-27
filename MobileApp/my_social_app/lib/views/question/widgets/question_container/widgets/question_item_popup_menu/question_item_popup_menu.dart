import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/services/question_user_complaint_service.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/question/widgets/question_container/widgets/question_item_popup_menu/question_actions.dart';
import 'package:my_social_app/views/question/widgets/question_container/widgets/question_item_popup_menu/question_item_popup_menu_constants.dart';
import 'package:my_social_app/views/question/pages/report_question_page/report_question_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class QuestionItemPopupMenu extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  
  const QuestionItemPopupMenu({
    super.key,
    required this.container,
  });


  void _delete(BuildContext context, QuestionState question){
    if(container.isNotLoadSuccess){
      throw loadException[getLanguage(context)]!;
    }
    DialogCreator
      .showAppDialog(
        context,
        title[getLanguage(context)]!,
        content[getLanguage(context)]!,
        delete[getLanguage(context)]!,
        Icons.delete,
        Colors.red
      )
      .then((response){
        if(response && context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(DeleteQuestionAction(question: question));
        }
      });
  }

  void _report(BuildContext context, QuestionState question){
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
              store.dispatch(DeleteQuestionSuccessAction(question: question));
            });
        }
      });
  }

  void _reload(BuildContext context){
    DialogCreator
      .showAppDialog(
        context,
        titleReload[getLanguage(context)]!,
        contentReload[getLanguage(context)]!,
        reload[getLanguage(context)]!,
        Icons.replay_outlined,
        Colors.black
      )
      .then((response){
        if(response && context.mounted){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(LoadQuestionAction(questionId: container.key));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final question = container.entity!;
    return PopupMenuButton<QuestionActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value){
        switch(value){
          case QuestionActions.delete:
            _delete(context, question);
          case QuestionActions.report:
            _report(context, question);
          case QuestionActions.reload:
            _reload(context);
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
            ),
          PopupMenuItem<QuestionActions>(
            value: QuestionActions.reload,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reload[getLanguage(context)]!
                ),
                const Icon(
                  Icons.replay_outlined
                )
              ],
            )
          )
        ];
      }
    );
  }
}