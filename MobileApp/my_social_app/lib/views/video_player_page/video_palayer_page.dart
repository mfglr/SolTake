import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:video_player/video_player.dart';

class VideoPalayerPage extends StatefulWidget {
  final List<SolutionState> solutions;  
  const VideoPalayerPage({
    super.key,
    required this.solutions
  });

  @override
  State<VideoPalayerPage> createState() => _VideoPalayerPageState();
}

class _VideoPalayerPageState extends State<VideoPalayerPage> {
  late List<VideoPlayerController?> _videoControllers;
  final PageController _pageController = PageController();

  void _onPageChange(){
    if(_pageController.hasClients){
      
    }
  }

  @override
  void initState() {
    _videoControllers = List.generate(widget.solutions.length, (index) => null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: 
          _controller.value.isInitialized
          ?  Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ) 
          : Container(),
      ),
    );
  }
}