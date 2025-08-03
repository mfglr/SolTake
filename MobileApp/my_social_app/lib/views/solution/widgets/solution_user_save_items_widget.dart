import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_user_save_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';

class SolutionUserSaveItemsWidget extends StatefulWidget {
  final QuestionState question;
  final Function onScrollBottom;
  final Pagination<int,SolutionUserSaveState> pagination;
  final int? solutionId;

  const SolutionUserSaveItemsWidget({
    super.key,
    required this.question,
    required this.onScrollBottom,
    required this.pagination,
    this.solutionId
  });

  @override
  State<SolutionUserSaveItemsWidget> createState() => _SolutionUserSaveItemsWidgetState();
}

class _SolutionUserSaveItemsWidgetState extends State<SolutionUserSaveItemsWidget> {
  final GlobalKey _solutionKey = GlobalKey(); 
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
 
  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
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
        children: [
          ...List.generate(
            widget.pagination.values.length,
            (index){
              final solution = widget.pagination.values.elementAt(index);
              return Container(
                key: widget.solutionId == solution.id ? _solutionKey : null,
                margin: const EdgeInsets.only(bottom: 15),
                child: SolutionItemWidget(question: widget.question, solution: solution.solution),
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