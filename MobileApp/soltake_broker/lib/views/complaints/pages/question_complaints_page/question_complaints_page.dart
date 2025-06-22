import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/on_scroll_bottom.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';
import 'package:soltake_broker/state/entity_state/action_dispathcers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';
import 'package:soltake_broker/views/complaints/pages/question_complaints_page/widgets/question_complaints_widget/question_complaints_widget.dart';
import 'package:soltake_broker/views/shared/loading_circle_widget.dart';

class QuestionComplaintsPage extends StatefulWidget {
  const QuestionComplaintsPage({super.key});

  @override
  State<QuestionComplaintsPage> createState() => _QuestionComplaintsPageState();
}

class _QuestionComplaintsPageState extends State<QuestionComplaintsPage> {
  final _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.questionUserComplaints, const NextQuestionUserComplaintsAction());
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const FirstQuestionUserComplaintsAction());
        return store.onChange.map((e) => e.questionUserComplaints).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int,QuestionUserComplaintState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.questionUserComplaints, NextQuestionUserComplaintsAction()),
        converter: (store) => store.state.questionUserComplaints,
        builder: (context, pagination) => SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(pagination.isEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sorular hakkında şikayet yok",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  QuestionComplaintsWidget(
                    questionComplaints: pagination.values,
                  ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}