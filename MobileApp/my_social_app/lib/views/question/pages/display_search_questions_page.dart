import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class DisplaySearchQuestionsPage extends StatelessWidget {
  final int? firstDisplayedQuestionId;
  
  const DisplaySearchQuestionsPage({
    super.key,
    this.firstDisplayedQuestionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SearchState>(
      converter: (store) => store.state.searchState,
      builder:(context,state) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: const Text(
            "Questions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Iterable<QuestionState>>(
          onInit: (store) => store.dispatch(const GetFirstPageSearhingQuestionsIfNoPageAction()),
          converter: (store) => store.state.selectSearchQuestions,
          builder: (context,questions) => QuestionItemsWidget(
            firstDisplayedQuestionId: firstDisplayedQuestionId,
            questions: questions,
            pagination: state.questions,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(const GetNextPageSearchingQuestionsIfReadyAction());
            },
          ),
        ),
      ),
    );
  }
}