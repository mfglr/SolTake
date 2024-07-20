import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/loading_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        if(!question.isLiked){
          store.dispatch(LikeQuestionAction(questionId: question.id));
        }
      },
      child: StoreConnector<AppState,Iterable<QuestionImageState>>(
        onInit: (store) => store.dispatch(LoadQuestionImageAction(id: question.images.first)),
        converter: (store) => store.state.questionImageEntityState.getQuestionImages(question.id),
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
              store.dispatch(LoadQuestionImageAction(id: question.images.elementAt(index)));
            },
          ),
        ),
      ),
    );
  }
}