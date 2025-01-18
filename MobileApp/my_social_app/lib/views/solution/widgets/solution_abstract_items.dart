import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_item_widget.dart';

class SolutionAbstractItems extends StatefulWidget {
  final Iterable<SolutionState> solutions;
  final Pagination pagination;
  final void Function() onScrollBottom;
  final void Function(int solutionId) onTap;
  final Widget noItems;

  const SolutionAbstractItems({
    super.key,
    required this.solutions,
    required this.pagination,
    required this.onScrollBottom,
    required this.onTap,
    required this.noItems
  });

  @override
  State<SolutionAbstractItems> createState() => _SolutionAbstractItemsState();
}

class _SolutionAbstractItemsState extends State<SolutionAbstractItems> {
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
    if(widget.pagination.isLast && widget.pagination.ids.isEmpty) return widget.noItems;
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.solutions.length,
            itemBuilder: (context,index) => SolutionAbstractItemWidget(
              key: ValueKey(widget.solutions.elementAt(index).id),
              solution: widget.solutions.elementAt(index),
              onTap: widget.onTap,
            )
          ),
        ),
        if(widget.pagination.loadingNext)
          const LoadingCircleWidget(strokeWidth: 3),
      ],
    );
  }
}