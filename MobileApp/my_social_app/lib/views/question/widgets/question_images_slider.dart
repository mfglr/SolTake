import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';
import 'package:redux/redux.dart';

class QuestionImagesSlider extends StatelessWidget {
  final QuestionState question;
  const QuestionImagesSlider({super.key,required this.question});

  double getMaxHeightSize(BuildContext context,Iterable<QuestionImageState> images){
    var max = images.first;
    for(final image in images){
      if(image.height > max.height){
        max = image;
      }
    }
    return (MediaQuery.of(context).size.width * max.height) / max.width;
  }

  void _loadQuestionImage(Store<AppState> store,int index){
    store.dispatch(LoadQuestionImageAction(id: question.images.elementAt(index)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(question.id),
      onDoubleTap: (){
        if(!question.isLiked){
          store.dispatch(LikeQuestionAction(questionId: question.id));
        }
      },
      child: StoreConnector<AppState,Iterable<QuestionImageState>>(
        onInit: (store) => _loadQuestionImage(store,0),
        converter: (store) => store.state.selectQuestionImages(question.id),
        builder: (context,imageStates) => CarouselSlider(
          items: imageStates.map(
            (imageState) => DisplayImageWidget(
              image: imageState.image, 
              status: imageState.state,
            )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: getMaxHeightSize(context, imageStates),
            enableInfiniteScroll: false,
            onPageChanged: (index, reason){
              final store = StoreProvider.of<AppState>(context,listen: false);
              _loadQuestionImage(store,index);
            },
          ),
        ),
      ),
    );
  }
}