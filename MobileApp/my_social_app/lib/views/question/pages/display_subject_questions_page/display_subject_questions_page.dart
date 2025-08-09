import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/pages/display_subject_questions_page/display_subject_questions_page_constants.dart';
import 'package:my_social_app/views/question/widgets/question_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplaySubjectQuestionsPage extends StatelessWidget {
  final SubjectState subject;
  const DisplaySubjectQuestionsPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final pagination = selectSubjectQuestionPagination(store, subject.id);
        if(!pagination.loadingNext){
          store.dispatch(RefreshSubjectQuestionsAction(subjectId: subject.id));
        }
        return onSubjectQuestionsLoaded(store, subject.id);
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
        body: StoreConnector<AppState, (KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final pagination = selectSubjectQuestionPagination(store, subject.id);
            if(pagination.noPage){
              store.dispatch(NextSubjectQuestionsAction(subjectId: subject.id));
            }
          },
          converter: (store) => selectSubjectPaginationAndQuestions(store, subject.id),
          builder: (context, data) => QuestionItems(
            data: data,
            noQuestionContent: notSubjectQuestions[getLanguage(context)]!,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context, listen: false);
               final pagination = selectSubjectQuestionPagination(store, subject.id);
              if(pagination.isReadyForNextPage){
                store.dispatch(NextSubjectQuestionsAction(subjectId: subject.id));
              }
            },
          ),
        ),
      ),
    );
  }
}