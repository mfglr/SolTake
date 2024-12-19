import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_solution_image.dart';

class SolutionAbstractItemWidget extends StatefulWidget {
  final SolutionState solution;
  final void Function(int solutionId) onTap;

  const SolutionAbstractItemWidget({
    super.key,
    required this.solution,
    required this.onTap
  });

  @override
  State<SolutionAbstractItemWidget> createState() => _SolutionAbstractItemWidgetState();
}

class _SolutionAbstractItemWidgetState extends State<SolutionAbstractItemWidget> {
  @override
  void initState() {
    if(widget.solution.images.firstOrNull != null){
      final store = StoreProvider.of<AppState>(context,listen: false);
      store.dispatch(LoadSolutionImageAction(solutionId: widget.solution.id, index: 0));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () => widget.onTap(widget.solution.id),
        child: Builder(
          builder: (context){
            final image = widget.solution.images.firstOrNull;
            if(image == null) return const NoSolutionImage();
            return DisplayImageWidget(
              image: image.data,
              width: 0,
              status: image.status,
              aspectRatio: 1,
              stackFit: StackFit.expand,
              boxFit: BoxFit.cover,
              centerWidget: widget.solution.hasVideo 
                ? const Icon(
                  color: Colors.white,
                  size: 60,
                  Icons.play_circle_fill_rounded,
                ) 
                : null,
            );
          }
        ),
      ),
    );
  }
}