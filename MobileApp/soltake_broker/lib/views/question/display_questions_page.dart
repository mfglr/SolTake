import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/on_scroll_bottom.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/question_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:soltake_broker/state/entity_state/action_dispathcers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';
import 'package:soltake_broker/views/question/widgets/questions_widget.dart';
import 'package:soltake_broker/views/shared/app_title.dart';

class DisplayQuestionsPage extends StatefulWidget {
  const DisplayQuestionsPage({super.key});

  @override
  State<DisplayQuestionsPage> createState() => _DisplayQuestionsPageState();
}

class _DisplayQuestionsPageState extends State<DisplayQuestionsPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.questions, NextAllNotPublishedQuestionsAction());
    }
  );

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(FirstAllNotPublishedQuestionsAction());
        return store.onChange.map((e) => e.questions).firstWhere((e) => !e.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppTitle(
            title: "Sorular",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: StoreConnector<AppState,Pagination<int, QuestionState>>(
              onInit: (store) => getNextEntitiesIfNoPage(store, store.state.questions, NextAllNotPublishedQuestionsAction()),
              converter: (store) => store.state.questions,
              builder: (context, pagination) => !pagination.isEmpty
                ? QuestionsWidget(questions: pagination.values)
                : Center(
                    child: Text(
                      "Soru yok",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}