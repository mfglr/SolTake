import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';

class SolutionItemsWidget extends StatefulWidget {
  final QuestionState question;
  final void Function() onScrollBottom;
  final Pagination<int,SolutionState> pagination;
  final int? solutionId;
  final Widget noItems;

  const SolutionItemsWidget({
    super.key,
    required this.question,
    required this.pagination,
    required this.onScrollBottom,
    required this.noItems,
    this.solutionId,
  });

  @override
  State<SolutionItemsWidget> createState() => _SolutionItemsWidgetState();
}

class _SolutionItemsWidgetState extends State<SolutionItemsWidget> {
  final GlobalKey _solutionKey = GlobalKey(); 
  final ScrollController _scrollController = ScrollController();
  void _onScrollBottom() => onScrollBottom(_scrollController,widget.onScrollBottom);
 
  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    WidgetsBinding.instance.addPostFrameCallback((_){
      final cContext = _solutionKey.currentContext;
      if(cContext != null){
        Scrollable.ensureVisible(cContext);
      }
    });
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(widget.pagination.isEmpty)
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: widget.noItems
                  )
                ],
              ),
            )
          else
            ...List.generate(
              widget.pagination.values.length,
              (index){
                final solution = widget.pagination.values.elementAt(index);
                return Container(
                  key: widget.solutionId == solution.id ? _solutionKey : null,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: SolutionItemWidget(
                    question: widget.question,
                    solution: solution
                  ),
                );
              }
            ),
          if(widget.pagination.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}