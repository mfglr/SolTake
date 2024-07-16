import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/loading_widget.dart';

class QuestionImagesSlider extends StatelessWidget {
  final QuestionState question;
  const QuestionImagesSlider({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: question.images.map(
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
        height: (MediaQuery.of(context).size.width * question.bigImage.height.toDouble()) / question.bigImage.width.toDouble(),
        enableInfiniteScroll: false,
        onPageChanged: (index, reason){
          store.dispatch(LoadQuestionImageAction(questionId: question.id, index: index));
        },
      ),
    );
  }
}