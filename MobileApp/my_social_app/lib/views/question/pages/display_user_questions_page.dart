import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplayUserQuestionsPage extends StatefulWidget {
  final UserState user;
  const DisplayUserQuestionsPage({super.key,required this.user});
  @override
  State<DisplayUserQuestionsPage> createState() => _DisplayUserQuestionsPageState();
}

class _DisplayUserQuestionsPageState extends State<DisplayUserQuestionsPage> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _nextPageQuestions;
  
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    _nextPageQuestions = (){
      if(_scrollController.hasClients){
        final position = _scrollController.position;
        if(position.pixels == position.maxScrollExtent){
          store.dispatch(NextPageOfUserQuestionsAction(userId:  widget.user.id));
        }
      }
    };
    _scrollController.addListener(_nextPageQuestions);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_nextPageQuestions);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          "${widget.user.formatName(10)}'s questions",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => store.dispatch(NextPageOfUserQuestionsAction(userId:widget.user.id)),
        converter: (store) => store.state.questionEntityState.selectQuestionsByUserId(widget.user.id),
        builder: (context,questions) => SingleChildScrollView(
          child: QuestionItemsWidget(questions: questions)
        ),
      ),
    );
  }
}