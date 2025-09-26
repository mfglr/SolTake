import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_widget.dart';

class SolutionContainerAbstractsLoadingWidget extends StatelessWidget {
  final int nuberOfColumn;
  final int count;
  const SolutionContainerAbstractsLoadingWidget({
    super.key,
    required this.count,
    this.nuberOfColumn = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        count,
        (index) => LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            height: constraints.constrainWidth() / 2,
            width: constraints.constrainWidth() / 2,
            child: const Padding(
              padding: EdgeInsetsGeometry.all(1),
              child: LoadingWidget()
            ),
          ),
        )
      )
    );
  }
}