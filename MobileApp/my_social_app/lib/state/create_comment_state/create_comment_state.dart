import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

class CreateCommentState{
  final QuestionState? question;
  final SolutionState? solution;
  final CommentState? parent;
  final String content;
  final String hintText;


  const CreateCommentState({
    required this.question,
    required this.solution,
    required this.parent,
    required this.content,
    required this.hintText,
  });

  CreateCommentState changeContent(String content)
    => CreateCommentState(
        question: question,
        solution: solution,
        parent: parent,
        content: content,
        hintText: hintText,
      );

  CreateCommentState changeQuestion(QuestionState question)
    => CreateCommentState(
        question: question,
        solution: null,
        parent: null,
        content: content,
        hintText: hintText,
      );
  
  CreateCommentState changeSolution(SolutionState solution)
    => CreateCommentState(
        question: null,
        solution: null,
        parent: parent,
        content: content,
        hintText: hintText,
      );

  CreateCommentState changeParent(CommentState parent)
    => CreateCommentState(
        question: question,
        solution: solution,
        parent: parent,
        content: content,
        hintText: hintText,
      );
  
  CreateCommentState cancelReply()
    => CreateCommentState(
        question: question,
        solution: solution,
        parent: null,
        content: "",
        hintText: hintText,
      );

  CreateCommentState changeHintText(String hintText)
    => CreateCommentState(
        question: question,
        solution: solution,
        parent: parent,
        content: content,
        hintText: hintText,
      );
}