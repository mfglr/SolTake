import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_multimedia_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

class SolutionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final bool isOwner;
  final bool isSaved;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final Pagination upvotes;
  final Pagination downvotes;
  final int numberOfDownvotes;
  final int state;
  final Iterable<SolutionMultimediaState> medias;
  final int numberOfComments;
  final Pagination comments;

  const SolutionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.isOwner,
    required this.isSaved,
    required this.userName,
    required this.content,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.medias,
    required this.numberOfComments,
    required this.comments,
    required this.state,
    required this.upvotes,
    required this.downvotes
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  SolutionState _optinal({
    String? newUserName,
    String? newContent,
    bool? newIsSaved,
    bool? newIsUpvoted,
    int? newNumberOfUpvotes,
    bool? newIsDownvoted,
    int? newNumberOfDownvotes,
    Pagination? newComments,
    Iterable<SolutionMultimediaState>? newMedias,
    int? newNumberOfComments,
    int? newState,
    Pagination? newUpvotes,
    Pagination? newDownvotes
  })
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        isOwner: isOwner,
        isSaved: newIsSaved ?? isSaved,
        userName: newUserName ?? userName,
        content: newContent ?? content,
        isUpvoted: newIsUpvoted ?? isUpvoted,
        numberOfUpvotes: newNumberOfUpvotes ?? numberOfUpvotes,
        isDownvoted: newIsDownvoted ?? isDownvoted,
        numberOfDownvotes: newNumberOfDownvotes ?? numberOfDownvotes,
        medias: newMedias ?? medias,
        numberOfComments: newNumberOfComments ?? numberOfComments,
        comments: newComments ?? comments,
        state: newState ?? state,
        upvotes: newUpvotes ?? upvotes,
        downvotes: newDownvotes ?? downvotes
      );

  SolutionState startLoadingNextUpvotes()
    => _optinal(newUpvotes: upvotes.startLoadingNext());
  SolutionState stopLoadingNextUpvotes()
    => _optinal(newUpvotes: upvotes.stopLoadingNext());
  SolutionState addNextUpvotes(Iterable<int> voteIds)
    => _optinal(newUpvotes: upvotes.addNextPage(voteIds));
  
  
  SolutionState makeUpvote(int upvoteId,int downvoteId)
    => _optinal(
      newIsUpvoted: true,
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newUpvotes: upvotes.prependOne(upvoteId),
      newIsDownvoted: false,
      newNumberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes,
      newDownvotes: isDownvoted ? downvotes.removeOne(downvoteId) : downvotes
    ); 
  SolutionState removeUpvote(int voteId)
    => _optinal(
      newIsUpvoted: false,
      newNumberOfUpvotes: numberOfUpvotes - 1,
      newUpvotes: upvotes.removeOne(voteId)
    );
  SolutionState addNewUpvote(int voteId)
    => _optinal(
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newUpvotes: upvotes.addInOrder(voteId),
    );

  SolutionState startLoadingNextDownvotes()
    => _optinal(newDownvotes: downvotes.startLoadingNext());
  SolutionState addNextDownvotes(Iterable<int> voteIds)
    => _optinal(newDownvotes: downvotes.addNextPage(voteIds));
  SolutionState stopLoadinNextDownvotes()
    => _optinal(newDownvotes: downvotes.stopLoadingNext());
    
  SolutionState makeDownvote(int upvoteId,int downvoteId)
    => _optinal(
      newIsUpvoted: false,
      newNumberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
      newUpvotes: isUpvoted ? upvotes.removeOne(upvoteId) : upvotes,
      newIsDownvoted: true,
      newNumberOfDownvotes: numberOfDownvotes + 1,
      newDownvotes: downvotes.prependOne(downvoteId),
    );
  SolutionState removeDownvote(int voteId)
    => _optinal(
      newIsDownvoted: false,
      newNumberOfDownvotes: numberOfDownvotes - 1,
      newDownvotes: downvotes.removeOne(voteId)
    );
  SolutionState addNewDownvote(int voteId)
    => _optinal(
      newNumberOfDownvotes: numberOfDownvotes + 1,
      newDownvotes: downvotes.addInOrder(voteId)
    );
  

  SolutionState startLoadingNextComments()
    => _optinal(newComments: comments.startLoadingNext());
  SolutionState addNextComments(Iterable<int> commentIds)
    => _optinal(newComments: comments.addNextPage(commentIds));
  SolutionState stopLoadingNextComments()
    => _optinal(newComments: comments.stopLoadingNext());
    
  SolutionState addComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.prependOne(commentId),
    );
  SolutionState removeComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments - 1,
      newComments: comments.removeOne(commentId),
    );
  SolutionState addNewComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.addInOrder(commentId)
    );

  SolutionState markAsCorrect()
    => _optinal(newState: SolutionStatus.correct);
  SolutionState markAsIncorrect()
    => _optinal(newState: SolutionStatus.incorrect);  

  SolutionState save()
    => _optinal(newIsSaved: true);
  SolutionState unsave()
    => _optinal(newIsSaved: false);
}