import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_widget.dart';

class QuestionAbstractItemWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionAbstractItemWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: StoreConnector<AppState,UserState>(
        converter: (store) => store.state.userEntityState.entities[question.appUserId]!,
        builder: (context,user) => GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(displayUserQuestionsRoute,arguments: user);
          },
          child: StoreConnector<AppState,QuestionImageState?>(
            onInit: (store) => store.dispatch(LoadQuestionImageAction(id: question.images.first)),
            converter: (store) => store.state.questionImageEntityState.entities[question.images.first],
            builder: (context,imageState) => Builder(
              builder: (context){
                if(imageState == null) return const LoadingWidget();
                return Image.memory(
                  imageState.image!,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}