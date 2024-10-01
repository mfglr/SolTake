// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:my_social_app/state/app_state/state.dart';
// import 'package:my_social_app/utilities/toast_creator.dart';
// import 'package:video_player/video_player.dart';

// class VideoPalayerPage extends StatefulWidget {
//   final Iterable<String> urls;
  
//   const VideoPalayerPage({
//     super.key,
//     required this.urls
//   });

//   @override
//   State<VideoPalayerPage> createState() => _VideoPalayerPageState();
// }

// class _VideoPalayerPageState extends State<VideoPalayerPage> {
//   late Iterable<VideoPlayerController> _videoControllers = [];
//   late Iterable<bool> _controllerStates = [];
//   late PageController _pageController = PageController();

//   void _onPageChange(){

//     if(_pageController.page != null){
//       ToastCreator.displaySuccess(_pageController.page.toString());
//     }
//   }

//   @override
//   void initState() {

//     _pageController.addListener(_onPageChange);
//     final store = StoreProvider.of<AppState>(context,listen: false);

//     // DefaultCacheManager()
//     //   .getSingleFile(
//     //     widget,
//     //     headers: {
//     //       "Authorization": "Bearer ${store.state.accessToken}",
//     //     }
//     //   )
//     //   .then((file){
//     //     _videoController = VideoPlayerController.file(file);
//     //     _videoController
//     //       .initialize()
//     //       .then((_) => setState(() { _isControllerInitialized = true; }));
//     //   });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.removeListener(_onPageChange);
//     _pageController.dispose();
//     super.dispose();
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         children: List.generate(
//           widget.urls.length,
//           (index) => Center(
//             child: Text(widget.urls.elementAt(index)),
//           )
          
//           // Center(
//             // child: _controllerStates.elementAt(index) ? AspectRatio(
//             //   aspectRatio: _videoControllers.elementAt(index).value.aspectRatio,
//             //   child: VideoPlayer(_videoController)
//             // ) : Container()
//           // ),
//         ) 
        
//       )
//     );
//   }
// }