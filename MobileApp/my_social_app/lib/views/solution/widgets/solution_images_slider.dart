import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/loading_widget.dart';

class SolutionImagesSlider extends StatelessWidget {
  final SolutionState solution;
  const SolutionImagesSlider({super.key,required this.solution});

  double getMaxHeightSize(BuildContext context,Iterable<SolutionImageState> images){
    var max = images.first;
    for(final image in images){
      if(image.height > max.height){
        max = image;
      }
    }
    return (MediaQuery.of(context).size.width * max.height) / max.width;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Iterable<SolutionImageState>>(
      onInit: (store) => store.dispatch(LoadSolutionImageAction(id: solution.images.first)),
      converter: (store) => store.state.getSolutionImages(solution.id),
      builder: (context,imageStates) => CarouselSlider(
        items: imageStates.map(
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
          height: getMaxHeightSize(context, imageStates),
          enableInfiniteScroll: false,
          onPageChanged: (index, reason){
            store.dispatch(
              LoadSolutionImageAction(
                id: solution.images.elementAt(index)
              )
            );
          },
        ),
      ),
    );
  }
}