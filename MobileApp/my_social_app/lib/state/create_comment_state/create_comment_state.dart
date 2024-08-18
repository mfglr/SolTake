import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

class CreateCommentState{
  final QuestionState? question;
  final SolutionState? solution;
  final CommentState? comment;
  final bool isRoot;
  final String content;
  final String hintText;


  const CreateCommentState({
    required this.question,
    required this.solution,
    required this.comment,
    required this.isRoot,
    required this.content,
    required this.hintText,
  });

  CreateCommentState changeContent(String content)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        isRoot: isRoot,
        content: content,
        hintText: hintText,
      );

  CreateCommentState changeQuestion(QuestionState question)
    => CreateCommentState(
        question: question,
        solution: null,
        comment: null,
        isRoot: isRoot,
        content: content,
        hintText: "Comment on ${question.formatUserName(10)}' s question...",
      );
  
  CreateCommentState changeSolution(SolutionState solution)
    => CreateCommentState(
        question: null,
        solution: solution,
        comment: null,
        isRoot: isRoot,
        content: content,
        hintText: hintText,
      );

  CreateCommentState changeComment(CommentState comment,bool isRoot)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        isRoot: isRoot,
        content: content,
        hintText: hintText,
      );
  
  CreateCommentState cancelReply()
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: null,
        isRoot: isRoot,
        content: "",
        hintText: hintText,
      );

  CreateCommentState changeHintText(String hintText)
    => CreateCommentState(
        question: question,
        solution: solution,
        comment: comment,
        isRoot: isRoot,
        content: content,
        hintText: hintText,
      );
}