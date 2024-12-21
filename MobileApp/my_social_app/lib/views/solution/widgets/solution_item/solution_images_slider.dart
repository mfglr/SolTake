// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
// import 'package:my_social_app/state/app_state/solution_entity_state/solution_multimedia_state.dart';
// import 'package:my_social_app/state/app_state/state.dart';
// import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
// import 'package:my_social_app/views/shared/display_image_widget.dart';

// class SolutionImagesSlider extends StatefulWidget {
//   final SolutionState solution;
//   const SolutionImagesSlider({super.key,required this.solution});

//   @override
//   State<SolutionImagesSlider> createState() => _SolutionImagesSliderState();
// }

// class _SolutionImagesSliderState extends State<SolutionImagesSlider> {

//   int _index = 0;
//   final CarouselSliderController _carouselController = CarouselSliderController();

//   void _changeIndex(index){
//     _carouselController
//       .animateToPage(
//         index,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.linear
//       );
//     setState(() { _index = index; });
//   }

//   double _getMinAspectRatio(BuildContext context,Iterable<SolutionMultimediaState> medias){
//     var min = medias.first.width / medias.first.height;
//     for(final media in medias){
//       var aspectRatio = (media.width / media.height);
//       if( aspectRatio < min ){
//         min = aspectRatio;
//       }
//     }
//     return min;
//   }

//   @override
//   void initState() {
//     final store = StoreProvider.of<AppState>(context,listen: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final aspectRatio = _getMinAspectRatio(context, widget.solution.images);
//     return Stack(
//       children: [
//         CarouselSlider(
//           carouselController: _carouselController,
//           key: ValueKey(widget.solution.id),
//           items: widget.solution.images.map(
//             (imageState) => DisplayImageWidget(
//               image: imageState.data,
//               status: imageState.status,
//               width: MediaQuery.of(context).size.width,
//               aspectRatio: aspectRatio,
//             )
//           ).toList(),
//           options: CarouselOptions(
//             autoPlay: false,
//             viewportFraction: 1,
//             height: MediaQuery.of(context).size.width / aspectRatio,
//             enableInfiniteScroll: false,
//             onPageChanged: (index, reason){
//               final store = StoreProvider.of<AppState>(context,listen: false);
//               setState(() { _index = index; });
//             },
//           ),
//         ),
//         if(widget.solution.images.length > 1)
//           Positioned(
//             bottom: 15,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CirclePaginationWidget(
//                     numberOfCircles: widget.solution.images.length,
//                     changeActiveIndex: _changeIndex,
//                     activeIndex: _index,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }