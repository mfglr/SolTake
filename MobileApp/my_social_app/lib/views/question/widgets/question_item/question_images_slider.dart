import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_multimedia_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';

class QuestionImagesSlider extends StatefulWidget {
  final QuestionState question;
  const QuestionImagesSlider({super.key,required this.question});

  @override
  State<QuestionImagesSlider> createState() => _QuestionImagesSliderState();
}

class _QuestionImagesSliderState extends State<QuestionImagesSlider> with TickerProviderStateMixin {
  bool _isLiked = false;
  int _index = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  double _getMinAspectRatio(BuildContext context,Iterable<QuestionMultimediaState> images){
    var min = images.first.width / images.first.height;
    for(final image in images){
      var aspectRatio = (image.width / image.height);
      if( aspectRatio < min){
        min = aspectRatio;
      }
    }
    return min;
  }

  void _changeIndex(index){
    _carouselController
      .animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear
      );
    setState(() { _index = index; });
  }

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoadQuestionImageAction(questionId: widget.question.id,index: 0));
    super.initState();
  }

  void _handleTap() {
    if(!widget.question.isLiked){
      store.dispatch(LikeQuestionAction(questionId: widget.question.id));
    }
    setState(() {
      _isLiked = true;
    });

    _controller
      .forward()
      .then((_){
        _controller
          .reverse()
          .then((_){
            setState(() {
              _isLiked = false;
            });
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(widget.question.id),
      onDoubleTap: _handleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            items: widget.question.medias.map(
              (imageState) => DisplayImageWidget(
                image: imageState.data,
                status: imageState.state,
                width: MediaQuery.of(context).size.width,
                aspectRatio: _getMinAspectRatio(context, widget.question.medias),
              )
            ).toList(),
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.width / _getMinAspectRatio(context, widget.question.medias),
              enableInfiniteScroll: false,
              onPageChanged: (index, reason){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(LoadQuestionImageAction(questionId: widget.question.id,index: index));
                setState(() { _index = index; });
              },
            ),
          ),
          if(widget.question.medias.length > 1)
            Positioned(
              bottom: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CirclePaginationWidget(
                      numberOfCircles: widget.question.medias.length,
                      changeActiveIndex: _changeIndex,
                      activeIndex: _index,
                    ),
                  ],
                ),
              ),
            ),
          if(_isLiked)
            Positioned(
              child: ScaleTransition(
                scale: _animation,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 100,
                ),
              )
            )
        ],
      ),
    );
  }
}