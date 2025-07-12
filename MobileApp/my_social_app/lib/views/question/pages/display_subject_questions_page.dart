import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplaySubjectQuestionsPage extends StatelessWidget {
  final SubjectState subject;
  const DisplaySubjectQuestionsPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectSubjectQuestions(store, subject.id),
          RefreshSubjectQuestionsAction(subjectId: subject.id)
        );
        return 
          store.onChange
            .map((state) => state.questions.subjectQuestions[subject.id]!)
            .firstWhere((e) => !e.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${AppLocalizations.of(context)!.display_subject_questions_page_title}: ${subject.name}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Pagination<int,QuestionState>>(
          onInit: (store) => 
            getNextPageIfNoPage(
              store,
              selectSubjectQuestions(store, subject.id),
              NextSubjectQuestionsAction(subjectId: subject.id)
            ),
          converter: (store) => selectSubjectQuestions(store, subject.id),
          builder: (context, pagination) => QuestionItemsWidget(
            questions: pagination.values,
            pagination: pagination,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context, listen: false);
              getNextPageIfReady(
                store,
                selectSubjectQuestions(store, subject.id),
                NextSubjectQuestionsAction(subjectId: subject.id)
              );
            },
          ),
        ),
      ),
    );
  }
}