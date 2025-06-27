import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplaySubjectQuestionsPage extends StatelessWidget {
  final int subjectId;
  const DisplaySubjectQuestionsPage({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SubjectState>(
      converter: (store) => store.state.subjectEntityState.getValue(subjectId)!,
      builder: (context,subject) => Scaffold(
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
        body: RefreshIndicator(
          onRefresh: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getPrevPageIfReady(store, subject.questions, PrevSubjectQuestionsAction(subjectId: subject.id));
            return store.onChange.map((state) => state.subjectEntityState.getValue(subjectId)!.questions).firstWhere((e) => !e.loadingPrev);
          },
          child: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(store,subject.questions,NextSubjectQuestionsAction(subjectId: subjectId)),
            converter: (store) => store.state.selectSubjectQuestions(subjectId),
            builder: (context,questions) => QuestionItemsWidget(
              questions: questions.toList(),
              pagination: subject.questions,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store,subject.questions,NextSubjectQuestionsAction(subjectId: subjectId));
              },
            ),
          ),
        ),
      ),
    );
  }
}