import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/custom_packages/scroll_controller_extentions/scroll_controller_extentions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_abstract_widget/solution_container_abstracts_loading_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_abstract_widget/solution_container_abstracts_widget.dart';

class DisplayCorrectSolutionsPage extends StatefulWidget {
  final int questionId;
  const DisplayCorrectSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  State<DisplayCorrectSolutionsPage> createState() => _DisplayCorrectSolutionsPageState();
}

class _DisplayCorrectSolutionsPageState extends State<DisplayCorrectSolutionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() =>
    _scrollController.onScrollBottom((){
      final store = StoreProvider.of<AppState>(context, listen: false);
      getNextEntitiesIfReady(
        store,
        selectQuestionCorrectSolutions(store, widget.questionId),
        NextQuestionCorrectSolutionsAction(questionId: widget.questionId)
      );
    });

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: RefreshIndicator(
        onRefresh: (){
          final store = StoreProvider.of<AppState>(context, listen: false);
          refreshEntities(
            store,
            selectQuestionCorrectSolutions(store, widget.questionId),
            RefreshQuestionCorrectSolutionsAction(questionId: widget.questionId)
          );
          return onQuestionCorrectSolutionsLoaded(store, widget.questionId);
        },
        child: StoreConnector<AppState, ContainerPagination<int, SolutionState>>(
          onInit: (store) => 
            getNextPageIfNoPage(
              store,
              selectQuestionCorrectSolutions(store, widget.questionId),
              NextQuestionCorrectSolutionsAction(questionId: widget.questionId)
            ),
          converter: (store) => selectQuestionCorrectSolutions(store, widget.questionId),
          builder: (context, pagination) => Column(
            children: [
              if(pagination.isEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoCorrectSolutionsWidget(),
                    ],
                  ),
                )
              else
                SolutionContainerAbstractsWidget(
                  containers: pagination.containers,
                  onTap: (container) =>
                    Navigator
                      .of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => DisplayQuestionCorrectSolutionsPage(
                            questionId: widget.questionId,
                            containerKey: container.key,
                          )
                        )
                      ),
                ),
              if(pagination.loadingNext)
                const SolutionContainerAbstractsLoadingWidget(
                  count: solutionsPerPage,
                )
            ],
          )
        ),
      ),
    );
  }
}