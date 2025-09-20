import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_container/question_containers_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'display_exam_questions_page_constant.dart';

class DisplayExamsQuestionsPage extends StatefulWidget {
  final ExamState exam;
  const DisplayExamsQuestionsPage({super.key, required this.exam});

  @override
  State<DisplayExamsQuestionsPage> createState() => _DisplayExamsQuestionsPageState();
}

class _DisplayExamsQuestionsPageState extends State<DisplayExamsQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(
        store,
        selectExamQuestions(store, widget.exam.id),
        NextExamQuestionsAction(examId: widget.exam.id)
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
        final paginantion = selectExamQuestions(store, widget.exam.id);
        if(!paginantion.loadingNext){
          store.dispatch(RefreshExamQuestionsAction(examId: widget.exam.id));
        }
        return onExamQuestionsLoaded(store, widget.exam.id);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${title[getLanguage(context)]}: ${widget.exam.initialism}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState, ContainerPagination<int, QuestionState>>(
          onInit: (store) => getNextEntitiesIfNoPage(
            store,
            selectExamQuestions(store, widget.exam.id),
            NextExamQuestionsAction(examId: widget.exam.id)
          ),
          converter: (store) => selectExamQuestions(store, widget.exam.id),
          builder: (context, pagination) => QuestionContinersWidget(
            containers: pagination.containers,
          ),
        ),
      )
    );
  }
}