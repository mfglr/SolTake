import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/exams_state/actions.dart';
import 'package:my_social_app/state/exams_state/exams_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/pages/create_question/widgets/exam_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectExamPage extends StatelessWidget {
  
  const SelectExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).width / 2;
    store.dispatch(const LoadExamsAction());

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: StoreConnector<AppState,ExamsState>(
        converter: (store) => store.state.examsState,
        builder:(context,state){
          if(state.isLoaded){
            return GridView.count(
              crossAxisCount: 2,
              children: List<Widget>.generate(
                state.exams.length,(index) => ExamItemWidget(
                  shortName: state.exams[index].shortName,
                  fullName: state.exams[index].fullName,
                  examId: state.exams[index].id,
                ) 
              )
            );
          }
          return const LoadingView();
        }
      ),
    );
  }
}