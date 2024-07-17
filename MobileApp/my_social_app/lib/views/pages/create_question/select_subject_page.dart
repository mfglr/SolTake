import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/pages/create_question/widgets/subject_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body:StoreConnector<AppState,AppState>(
        onInit: (store) => store.dispatch(const LoadSubjectsByExamIdAction()),
        converter: (store) => store.state,
        builder:(context,state){
          final subjects = state.subjects;
          if(state.areSubjectsLoaded){
            return GridView.count(
              crossAxisCount: 2,
              children: List<Widget>.generate(
                subjects.length,(index) => SubjectItemWidget(
                  name: subjects[index].name,
                  id: subjects[index].id,
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