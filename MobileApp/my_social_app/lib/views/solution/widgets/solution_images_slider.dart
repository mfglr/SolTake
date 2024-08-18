import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class SolutionImagesSlider extends StatefulWidget {
  final SolutionState solution;
  const SolutionImagesSlider({super.key,required this.solution});

  @override
  State<SolutionImagesSlider> createState() => _SolutionImagesSliderState();
}

class _SolutionImagesSliderState extends State<SolutionImagesSlider> {

  double _getMaxHeightSize(BuildContext context,Iterable<SolutionImageState> images){
    var max = images.first;
    for(final image in images){
      if(image.height > max.height){
        max = image;
      }
    }
    return (MediaQuery.of(context).size.width * max.height) / max.width;
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoadSolutionImageAction(solutionId: widget.solution.id,index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      key: ValueKey(widget.solution.id),
      items: widget.solution.images.map(
        (imageState) => Builder(
          builder: (context){
            if(imageState.image != null) return Image.memory(imageState.image!);
            return const LoadingWidget();
          }
        )
      ).toList(),
      options: CarouselOptions(
        autoPlay: false,
        viewportFraction: 1,
        height: _getMaxHeightSize(context, widget.solution.images),
        enableInfiniteScroll: false,
        onPageChanged: (index, reason){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(LoadSolutionImageAction(solutionId: widget.solution.id,index: index));
        },
      ),
    );
  }
}