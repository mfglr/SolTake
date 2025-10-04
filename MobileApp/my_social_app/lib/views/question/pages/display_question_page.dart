import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_container_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

const _title = {
  Languages.en: "' s question",
  Languages.tr: " kullanıcısının sorusu"
};

class DisplayQuestionPage extends StatefulWidget {
  final int questionId;
  final int? parentId;

  const DisplayQuestionPage({
    super.key,
    required this.questionId,
    this.parentId,
  });

  @override
  State<DisplayQuestionPage> createState() => _DisplayQuestionPageState();
}

class _DisplayQuestionPageState extends State<DisplayQuestionPage> {
  @override
  void initState() {
    if(widget.parentId != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator
          .of(context)
          .push(
            ModalBottomSheetRoute(
              builder: (context) => DisplayQuestionCommentsModal(
                questionId: widget.questionId,
                parentId: widget.parentId,
              ), 
              isScrollControlled: true
            )
          );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<int, QuestionState>>(
      onInit: (store) => loadIfNotLoading(
        store,
        selectQuestion(store, widget.questionId),
        LoadQuestionAction(questionId: widget.questionId)
      ),
      converter: (store) => selectQuestion(store, widget.questionId),
      builder: (context, container) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child: (language) => AppTitle(
              title: "${container.entity!.userName}${_title[language]}"
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: QuestionContainerWidget(
            container: container,
          )
        ),
      )
    );
  }
}