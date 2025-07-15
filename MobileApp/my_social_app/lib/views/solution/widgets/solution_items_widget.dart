import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';

class SolutionItemsWidget extends StatefulWidget {
  final Iterable<SolutionState> solutions;
  final Function onScrollBottom;
  final Pagination<num,Id<num>> pagination;
  final num? solutionId;

  const SolutionItemsWidget({
    super.key,
    required this.pagination,
    required this.solutions,
    required this.onScrollBottom,
    this.solutionId,
  });

  @override
  State<SolutionItemsWidget> createState() => _SolutionItemsWidgetState();
}

class _SolutionItemsWidgetState extends State<SolutionItemsWidget> {
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
            widget.solutions.length,
            (index){
              final solution = widget.solutions.elementAt(index);
              return Container(
                key: widget.solutionId == solution.id ? _solutionKey : null,
                margin: const EdgeInsets.only(bottom: 15),
                child: SolutionItemWidget(solution: solution),
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