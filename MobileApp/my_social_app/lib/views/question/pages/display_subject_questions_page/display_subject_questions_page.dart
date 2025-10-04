import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_containers_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

class DisplaySubjectQuestionsPage extends StatefulWidget {
  final SubjectState subject;
  const DisplaySubjectQuestionsPage({super.key, required this.subject});

  @override
  State<DisplaySubjectQuestionsPage> createState() => _DisplaySubjectQuestionsPageState();
}

class _DisplaySubjectQuestionsPageState extends State<DisplaySubjectQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context, listen: false);
      getNextEntitiesIfReady(
        store,
        selectSubjectQuestions(store, widget.subject.id),
        NextSubjectQuestionsAction(subjectId: widget.subject.id)
      );
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectSubjectQuestions(store,widget.subject.id),
          RefreshSubjectQuestionsAction(subjectId: widget.subject.id)
        );
        return onSubjectQuestionsLoaded(store, widget.subject.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${AppLocalizations.of(context)!.display_subject_questions_page_title}: ${widget.subject.name}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
          onInit: (store) => 
            getNextEntitiesIfNoPage(
              store,
              selectSubjectQuestions(store,widget.subject.id),
              NextSubjectQuestionsAction(subjectId: widget.subject.id)
            ),
          converter: (store) => selectSubjectQuestions(store, widget.subject.id),
          builder: (context, pagination) => SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                QuestionContinersWidget(
                  containers: pagination.containers,
                ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}