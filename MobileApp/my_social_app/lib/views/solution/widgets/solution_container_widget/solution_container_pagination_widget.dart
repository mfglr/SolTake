import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_widget.dart';

class SolutionContainerPaginationWidget extends StatefulWidget {
  final ContainerPagination<int, SolutionState> pagination;
  final void Function() onScrollBottom;
  final int containerKey;
  final Widget noItemsWidget;

  const SolutionContainerPaginationWidget({
    super.key,
    required this.pagination,
    required this.onScrollBottom,
    required this.containerKey,
    required this.noItemsWidget
  });

  @override
  State<SolutionContainerPaginationWidget> createState() => _SolutionContainerPaginationWidgetState();
}

class _SolutionContainerPaginationWidgetState extends State<SolutionContainerPaginationWidget> {
  final GlobalKey _solutionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(widget.onScrollBottom);
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
    _scrollController.removeListener(widget.onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          if(widget.pagination.isEmpty)
            widget.noItemsWidget
          else
            Column(
              children: widget.pagination.containers
                .map((container) => SolutionContainerWidget(
                  key: widget.containerKey == container.key ? _solutionKey : null,
                  container: container
                ))
                .toList()
            ),
          if(widget.pagination.loadingNext)
            const LoadingCircleWidget()
        ],
      ),
    );

  }
}