import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/state/app_state/state.dart';
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

  void _play(int solutionId){
    final controller = _videoControllers[solutionId];
    if(controller != null){
      controller.play().then((_){ setState((){}); });
      _videoControllers.forEach((key,value){
        if(key != solutionId && value.value.isInitialized && value.value.isPlaying){
          value.pause().then((_){ setState((){}); });
        }
      });
    }
  }

  void _pause(int solutionId){
    final controller = _videoControllers[solutionId];
    if(controller != null){
      controller.pause().then((_){ setState((){}); });
    }
  }
  
  void _setVideoControllers(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    final s = widget.solutions.where((x) => x.hasVideo);
    for(var solution in s){
      if(_videoControllers[solution.id] == null){
        DefaultCacheManager()
        .getSingleFile(
          "${dotenv.env['API_URL']}/api/$solutionController/$getSolutionVideoEndpoint/${solution.id}",
          headers: { "Authorization": "Bearer ${store.state.accessToken}" }
        )
        .then((file){
          final controller = VideoPlayerController.file(file);
          controller
            .initialize()
            .then((_){ setState((){}); });
          
          controller.addListener((){
            if(controller.value.isCompleted){
              setState(() {});
            }
          });

          controller.addListener((){
            Future
              .delayed(const Duration(milliseconds: 1000))
              .then((_){ setState(() {});});
          });

          _videoControllers[solution.id] = controller;
        });
      }
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
    _setVideoControllers();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SolutionItemsWidget oldWidget) {

    if(oldWidget.solutions.length != widget.solutions.length){
      _setVideoControllers();
      super.didUpdateWidget(oldWidget);
      return;
    }

    for(int i = 0; i < oldWidget.solutions.length; i++){
      if(oldWidget.solutions.elementAt(i).id != widget.solutions.elementAt(i).id){
        _setVideoControllers();
        super.didUpdateWidget(oldWidget);
        return;
      }
    }
    
    super.didUpdateWidget(oldWidget);
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