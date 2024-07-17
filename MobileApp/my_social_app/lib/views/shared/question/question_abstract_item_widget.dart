import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_widget.dart';

class QuestionAbstractItemWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionAbstractItemWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    store.dispatch(LoadQuestionImageAction(questionId: question.id, index: 0));
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: StoreConnector<AppState,UserState>(
        converter: (store) => store.state.userEntityState.users[question.appUserId]!,
        builder: (context,user) => GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(displayUserQuestionsRoute,arguments: user);
          },
          child: Builder(
            builder:(context){
              final imageState = question.images[0];
              if(imageState.file != null){
                return Image.file(
                  File(imageState.file!.name),
                  fit: BoxFit.cover,
                );
              }
              if(imageState.image != null){
                return Image.memory(
                  imageState.image!,
                  fit: BoxFit.cover,
                );
              }
              return const LoadingWidget();
            } ,
          ),
        ),
      ),
    );
  }
}