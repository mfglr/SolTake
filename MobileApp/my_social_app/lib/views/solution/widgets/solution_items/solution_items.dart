import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/packages/entity_state/key_pagination.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';

class SolutionItems extends StatefulWidget {
  final void Function() onScrollBottom;
  final (KeyPagination<int>, Iterable<SolutionState>) data;
  final int? solutionId;
  final Widget noItems;

  const SolutionItems({
    super.key,
    required this.data,
    required this.onScrollBottom,
    required this.noItems,
    this.solutionId,
  });

  @override
  State<SolutionItems> createState() => _SolutionItemsState();
}

class _SolutionItemsState extends State<SolutionItems> {
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
          if(widget.data.$1.isEmpty)
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
              widget.data.$2.length,
              (index){
                final solution = widget.data.$2.elementAt(index);
                return Container(
                  key: widget.solutionId == solution.id ? _solutionKey : null,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: SolutionItemWidget(
                    solution: solution
                  ),
                );
              }
            ),
          if(widget.data.$1.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}