import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/loading_widget.dart';

class QuestionAbstractItemWidget extends StatefulWidget {
  final QuestionState state;
  const QuestionAbstractItemWidget({super.key,required this.state});

  @override
  State<QuestionAbstractItemWidget> createState() => _QuestionAbstractItemWidgetState();
}

class _QuestionAbstractItemWidgetState extends State<QuestionAbstractItemWidget> {
  
  @override
  void initState() {
    store.dispatch(LoadQuestionImageAction(questionId: widget.state.id, index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Builder(
        builder:(context){
          final imageState = widget.state.images[0];
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
    );
  }
}