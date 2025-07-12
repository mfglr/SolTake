import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_user_vote_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

class SolutionState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int userId;
  final bool isOwner;
  final bool isSaved;
  final String userName;
  final String? content;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final Pagination<int,SolutionUserVoteState> upvotes;
  final Pagination<int,SolutionUserVoteState> downvotes;
  final int numberOfDownvotes;
  final int state;
  final Iterable<Multimedia> medias;
  final int numberOfComments;
  final Pagination<int,Id<int>> comments;
  final bool doesBelongToQuestionOfCurrentUser;
  final Multimedia? image;
  final bool isCreatedByAI;
  final String? aiModelName;
  final Multimedia? aiImage;

  @override
  int get avatarId => userId;

  @override
  Multimedia? get avatar => image;

  SolutionState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.userId,
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
    required this.downvotes,
    required this.doesBelongToQuestionOfCurrentUser,
    required this.image,
    required this.isCreatedByAI,
    required this.aiModelName,
    required this.aiImage
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
    Pagination<int,Id<int>>? newComments,
    Iterable<Multimedia>? newMedias,
    int? newNumberOfComments,
    int? newState,
    Pagination<int,SolutionUserVoteState>? newUpvotes,
    Pagination<int,SolutionUserVoteState>? newDownvotes,
    Multimedia? newImage,
  })
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        userId: userId,
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
        downvotes: newDownvotes ?? downvotes,
        doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
        image: newImage ?? image,
        isCreatedByAI: isCreatedByAI,
        aiModelName: aiModelName,
        aiImage: aiImage
      );

  SolutionState startLoadingNextUpvotes()
    => _optinal(newUpvotes: upvotes.startLoadingNext());
  SolutionState stopLoadingNextUpvotes()
    => _optinal(newUpvotes: upvotes.stopLoadingNext());
  SolutionState addNextUpvotes(Iterable<SolutionUserVoteState> votes)
    => _optinal(newUpvotes: upvotes.addNextPage(votes));
  
  SolutionState makeUpvote(SolutionUserVoteState vote)
    => _optinal(
      newIsUpvoted: true,
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newUpvotes: upvotes.prependOne(vote),
      newIsDownvoted: false,
      newNumberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes,
      newDownvotes: downvotes.where((e) => e.userId != vote.userId)
    ); 
  SolutionState removeUpvote(int userId)
    => _optinal(
      newIsUpvoted: false,
      newNumberOfUpvotes: numberOfUpvotes - 1,
      newUpvotes: upvotes.where((e) => e.userId != userId)
    );
  SolutionState addNewUpvote(SolutionUserVoteState vote)
    => _optinal(
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newUpvotes: upvotes.addInOrder(vote),
    );

  SolutionState startLoadingNextDownvotes()
    => _optinal(newDownvotes: downvotes.startLoadingNext());
  SolutionState addNextDownvotes(Iterable<SolutionUserVoteState> votes)
    => _optinal(newDownvotes: downvotes.addNextPage(votes));
  SolutionState stopLoadingNextDownvotes()
    => _optinal(newDownvotes: downvotes.stopLoadingNext());
    
  SolutionState makeDownvote(SolutionUserVoteState vote)
    => _optinal(
      newIsUpvoted: false,
      newNumberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
      newUpvotes: upvotes.where((e) => e.userId != vote.userId),
      newIsDownvoted: true,
      newNumberOfDownvotes: numberOfDownvotes + 1,
      newDownvotes: downvotes.prependOne(vote),
    );
  SolutionState removeDownvote(int userId)
    => _optinal(
      newIsDownvoted: false,
      newNumberOfDownvotes: numberOfDownvotes - 1,
      newDownvotes: downvotes.where((e) => e.userId != userId)
    );
  SolutionState addNewDownvote(SolutionUserVoteState vote)
    => _optinal(
      newNumberOfDownvotes: numberOfDownvotes + 1,
      newDownvotes: downvotes.addInOrder(vote)
    );
  
  SolutionState startLoadingNextComments()
    => _optinal(newComments: comments.startLoadingNext());
  SolutionState addNextComments(Iterable<int> commentIds)
    => _optinal(newComments: comments.addNextPage(commentIds.map((commentId) => Id(id: commentId))));
  SolutionState stopLoadingNextComments()
    => _optinal(newComments: comments.stopLoadingNext());
    
  SolutionState addComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.prependOne(Id(id: commentId)),
    );
  SolutionState removeComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments - 1,
      newComments: comments.removeOne(commentId),
    );
  SolutionState addNewComment(int commentId) =>
    _optinal(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.addInOrder(Id(id: commentId))
    );

  SolutionState markAsCorrect()
    => _optinal(newState: SolutionStatus.correct);
  SolutionState markAsIncorrect()
    => _optinal(newState: SolutionStatus.incorrect);  

  SolutionState save() => _optinal(newIsSaved: true);
  SolutionState unsave() => _optinal(newIsSaved: false);
}