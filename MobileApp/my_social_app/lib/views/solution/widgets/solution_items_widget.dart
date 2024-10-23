import 'package:flutter/material.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_item_widget.dart';
import 'package:video_player/video_player.dart';

class SolutionItemsWidget extends StatefulWidget {
  final Iterable<SolutionState> solutions;
  final Function onScrollBottom;
  final Pagination pagination;
  final int? solutionId;

  const SolutionItemsWidget({
    super.key,
    required this.pagination,
    required this.solutions,
    required this.onScrollBottom,
    this.solutionId,
  });

  @override
  State<SolutionItemsWidget> createState() => _SolutionItemsWidgetState();
}

class _SolutionItemsWidgetState extends State<SolutionItemsWidget> {
  final GlobalKey _solutionKey = GlobalKey(); 
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
  
  final Map<int,VideoPlayerController> _videoControllers = {};

  void _playController(int solutionId){
    if(context.mounted){
      _videoControllers[solutionId]!
        .play()
        .then((_){ setState((){}); });
    }
    

    _videoControllers.forEach((key,value){
      if(key != solutionId && value.value.isPlaying){
        value.pause().then((_){ setState((){}); });
      }
    });
  }

  void _setController(int solutionId){
    final controller = VideoPlayerController
      .networkUrl(
        AppClient().generateUri("$solutionController/$getSolutionVideoEndpoint/$solutionId"),
        httpHeaders: AppClient().getHeader()
      );
      
      if(context.mounted){
        controller
        .initialize()
        .then((_){
          _videoControllers[solutionId] = controller;
          _playController(solutionId);
        });
      }
      
  }

  void _play(int solutionId){
    final controller = _videoControllers[solutionId];
    if(controller != null){
      _playController(solutionId);
    }
    else{
      _setController(solutionId);
    }
  }

  void _pause(int solutionId){
    final controller = _videoControllers[solutionId];
    if(controller != null && controller.value.isPlaying){
      controller.pause().then((_){ setState((){}); });
    }
  }
 
  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        widget.onScrollBottom();
      }
    };
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

    for(var controller in _videoControllers.values){
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          ...List.generate(
            widget.solutions.length,
            (index){
              final solution = widget.solutions.elementAt(index);
              return Container(
                key: widget.solutionId == solution.id ? _solutionKey : null,
                margin: const EdgeInsets.only(bottom: 15),
                child: SolutionItemWidget(
                  solution: solution,
                  controller: _videoControllers[solution.id],
                  play: solution.hasVideo ? _play : null,
                  pause: solution.hasVideo ? _pause : null,
                ),
              );
            }
          ),
          if(widget.pagination.loadingNext)
            const LoadingCircleWidget(strokeWidth: 3)
        ]
      ),
    );
  }
}