import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_button.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/widgets/create_solution_by_ai_button.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_incorrect_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/pages/display_question_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


const List<IconData> icons = [Icons.all_out_sharp, Icons.check, Icons.pending, Icons.close, Icons.upload];

class DisplayQuestionAbstractSolutionsPage extends StatefulWidget {
  final int questionId;
  const DisplayQuestionAbstractSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  State<DisplayQuestionAbstractSolutionsPage> createState() => _DisplayQuestionAbstractSolutionsPageState();
}

class _DisplayQuestionAbstractSolutionsPageState extends State<DisplayQuestionAbstractSolutionsPage> {
  final PageController _pageController = PageController();
  late final void Function() _setPage;
  double _page = 0;

  @override
  void initState() {
    _setPage = (){
      setState(() {
        _page = _pageController.page ?? 0;
      });
    };
    _pageController.addListener(_setPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_setPage);
    _pageController.dispose();
    super.dispose();
  }

  Widget _displayAllSolutions(QuestionState question){
    return StoreConnector<AppState,Iterable<SolutionState>>(
      onInit: (store) => getNextPageIfNoPage(store,question.solutions,NextQuestionSolutionsAction(questionId: question.id)),
      converter: (store) => store.state.selectQuestionSolutions(widget.questionId),
      builder: (context,solutions) => SolutionAbstractItems(
        solutions: solutions,
        pagination: question.solutions,
        noItems: NoSolutionsWidget(question: question),
        onTap: (solutionId) =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayQuestionSolutionsPage(
                  questionId: widget.questionId,
                  solutionId: solutionId,
                )
              )
            ),
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(store,question.solutions,NextQuestionSolutionsAction(questionId: question.id));
        },
      )
    );
  }

  Widget _displayCorrectSolutions(QuestionState question){
    return StoreConnector<AppState,Iterable<SolutionState>>(
      onInit: (store) => getNextPageIfNoPage(
        store,
        question.correctSolutions,
        NextQuestionCorrectSolutionsAction(questionId: question.id)
      ),
      converter: (store) => store.state.selectQuestionCorrectSolutions(widget.questionId),
      builder: (context,solutions) => SolutionAbstractItems(
        solutions: solutions,
        pagination: question.correctSolutions,
        noItems: NoSolutions(
          text: AppLocalizations.of(context)!.display_question_solutions_page_no_correct_solutins
        ),
        onTap: (solutionId) =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayQuestionCorrectSolutionsPage(
                  questionId: widget.questionId,
                  solutionId: solutionId,  
                )
              )
            ),
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(
            store,
            question.correctSolutions,
            NextQuestionCorrectSolutionsAction(questionId: question.id)
          );
        },
      )
    );
  }

  Widget _displayPendingSolutions(QuestionState question){
    return StoreConnector<AppState,Iterable<SolutionState>>(
      onInit: (store) => getNextPageIfNoPage(
        store,
        question.pendingSolutions,
        NextQuestionPendingSolutionsAction(questionId: question.id)
      ),
      converter: (store) => store.state.selectQuestionPendingSolutions(widget.questionId),
      builder: (context,solutions) => SolutionAbstractItems(
        solutions: solutions,
        pagination: question.pendingSolutions,
        noItems: NoSolutions(
          text: AppLocalizations.of(context)!.display_question_solutions_page_no_pending_solutions
        ),
        onTap: (solutionId) =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayQuestionPendingSolutionsPage(
                  questionId: widget.questionId,
                  solutionId: solutionId,
                )
              )
            ),
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(
            store,
            question.pendingSolutions,
            NextQuestionPendingSolutionsAction(questionId: question.id)
          );
        },
      )
    );
  }

  Widget _displayIncorrectSolutions(QuestionState question){
    return StoreConnector<AppState,Iterable<SolutionState>>(
      onInit: (store) => getNextPageIfNoPage(
        store,
        question.incorrectSolutions,
        NextQuestionIncorrectSolutionsAction(questionId: question.id),
      ),
      converter: (store) => store.state.selectQuestionIncorrectSolutions(widget.questionId),
      builder: (context,solutions) => SolutionAbstractItems(
        solutions: solutions,
        pagination: question.incorrectSolutions,
         noItems: NoSolutions(
          text: AppLocalizations.of(context)!.display_question_solutions_page_no_incorrect_solutions
        ),
        onTap: (solutionId) =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayQuestionIncorrectSolutionsPage(
                  questionId: widget.questionId,
                  solutionId: solutionId,
                )
              )
            ),
        onScrollBottom: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(
            store,
            question.incorrectSolutions,
            NextQuestionIncorrectSolutionsAction(questionId: question.id),
          );
        },
      )
    );
  }
  
  Widget _displayUploads(QuestionState question){
    return StoreConnector<AppState,Iterable<UploadState>>(
      converter: (store) => store.state.uploadEntityState.getUploadSolutions(question.id),
      builder: (context,items) => UploadItems(items: items),
    );
  }

  Widget _labelBuilder(QuestionState question,bool isActive, index){
    return Icon(
      icons[index],
      color: isActive ? Colors.black : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: widget.questionId)),
      converter: (store) => store.state.questionEntityState.entities[widget.questionId],
      builder:(context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: Text(
              AppLocalizations.of(context)!.display_question_solutions_page_title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          floatingActionButton:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if(question.isSolveableByAi)
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: CreateSolutionByAiButton(questionId: question.id)
                  ),
                if(!question.isOwner)
                  CreateSolutionButton(questionId: question.id,pageController: _pageController),
              ],
            ),
          body: Column(
            children: [
              LabelPaginationWidget(
                labelBuilder: (isActive,index) => _labelBuilder(question,isActive,index),
                page: _page,
                labelCount: icons.length,
                width: MediaQuery.of(context).size.width,
                initialPage: 0,
                pageController: _pageController
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    _displayAllSolutions(question),
                    _displayCorrectSolutions(question),
                    _displayPendingSolutions(question),
                    _displayIncorrectSolutions(question),
                    _displayUploads(question)
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

  
}