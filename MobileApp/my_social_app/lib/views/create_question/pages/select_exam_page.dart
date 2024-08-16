import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/create_question/widgets/exam_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectExamPage extends StatelessWidget {
  const SelectExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const Text("Select an Exam"),
      ),
      body: StoreConnector<AppState,ExamEntityState>(
        onInit: (store) => store.dispatch(const GetAllExamsAction()),
        converter: (store) => store.state.examEntityState,
        builder:(context,state){
          if(state.isLoading) return const LoadingView();
          return GridView.count(
            crossAxisCount: 2,
            children: List<Widget>.generate(
              state.exams.length,
              (index) => ExamItemWidget(
                exam: state.exams.elementAt(index)
              )
            )
          );
        }
      ),
    );
  }
}