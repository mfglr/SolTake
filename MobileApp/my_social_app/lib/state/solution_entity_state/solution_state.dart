import 'package:my_social_app/state/solution_entity_state/solution_status.dart';

class SolutionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final String userName;
  final String content;
  final int state;
  final bool isUpvoted;
  final int numberOfUpvotes;
  final bool isDownvoted;
  final int numberOfDownvotes;
  final bool isOwner;
  final Iterable<int> images;

  const SolutionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.state,
    required this.isUpvoted,
    required this.numberOfUpvotes,
    required this.isDownvoted,
    required this.numberOfDownvotes,
    required this.isOwner,
    required this.images
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  SolutionState markAsApproved()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: SolutionStatus.approved,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        isOwner: isOwner,
        images: images
      );
  
  SolutionState markAsPending()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: SolutionStatus.pending,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        isOwner: isOwner,
        images: images
      );


  SolutionState makeUpvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: state,
        isUpvoted: true,
        numberOfUpvotes: numberOfUpvotes + 1,
        isDownvoted: false,
        numberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes,
        isOwner: isOwner,
        images: images
      );
  
  SolutionState makeDownvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: state,
        isUpvoted: false,
        numberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
        isDownvoted: true,
        numberOfDownvotes: numberOfDownvotes + 1,
        isOwner: isOwner,
        images: images
      );

   SolutionState removeUpvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: state,
        isUpvoted: false,
        numberOfUpvotes: numberOfUpvotes - 1,
        isDownvoted: isDownvoted,
        numberOfDownvotes: numberOfDownvotes,
        isOwner: isOwner,
        images: images
      );

  SolutionState removeDownvote()
    => SolutionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        content: content,
        state: state,
        isUpvoted: isUpvoted,
        numberOfUpvotes: numberOfUpvotes,
        isDownvoted: false,
        numberOfDownvotes: numberOfDownvotes - 1,
        isOwner: isOwner,
        images: images
      );
}