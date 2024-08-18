import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';

class QuestionImagesSlider extends StatefulWidget {
  final QuestionState question;
  const QuestionImagesSlider({super.key,required this.question});

  @override
  State<QuestionImagesSlider> createState() => _QuestionImagesSliderState();
}

class _QuestionImagesSliderState extends State<QuestionImagesSlider> {
  
  double _getMaxHeightSize(BuildContext context,Iterable<QuestionImageState> images){
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
    store.dispatch(LoadQuestionImageAction(questionId: widget.question.id,index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(widget.question.id),
      onDoubleTap: (){
        if(!widget.question.isLiked){
          store.dispatch(LikeQuestionAction(questionId: widget.question.id));
        }
      },
      child: CarouselSlider(
          items: widget.question.images.map(
            (imageState) => DisplayImageWidget(
              image: imageState.image, 
              status: imageState.state,
            )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: _getMaxHeightSize(context, widget.question.images),
            enableInfiniteScroll: false,
            onPageChanged: (index, reason){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(LoadQuestionImageAction(questionId: widget.question.id,index: index));
            },
          ),
        ),
    );
  }
}