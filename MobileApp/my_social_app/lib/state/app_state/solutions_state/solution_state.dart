import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_status.dart';

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
  final int numberOfDownvotes;
  final int state;
  final Iterable<Multimedia> medias;
  final int numberOfComments;
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
    required this.state,
    required this.doesBelongToQuestionOfCurrentUser,
    required this.image,
    required this.isCreatedByAI,
    required this.aiModelName,
    required this.aiImage
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  bool get hasVideo => medias.any((e) => e.multimediaType == MultimediaType.video);

  SolutionState _optional({
    String? newUserName,
    String? newContent,
    bool? newIsSaved,
    bool? newIsUpvoted,
    int? newNumberOfUpvotes,
    bool? newIsDownvoted,
    int? newNumberOfDownvotes,
    Iterable<Multimedia>? newMedias,
    int? newNumberOfComments,
    int? newState,
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
        state: newState ?? state,
        doesBelongToQuestionOfCurrentUser: doesBelongToQuestionOfCurrentUser,
        image: newImage ?? image,
        isCreatedByAI: isCreatedByAI,
        aiModelName: aiModelName,
        aiImage: aiImage
      );

  SolutionState makeUpvote() =>
    _optional(
      newIsUpvoted: true,
      newIsDownvoted: false,
      newNumberOfUpvotes: numberOfUpvotes + 1,
      newNumberOfDownvotes: isDownvoted ? numberOfDownvotes - 1 : numberOfDownvotes
    );
  SolutionState removeUpvote() =>
    _optional(
      newIsUpvoted: false,
      newNumberOfUpvotes: numberOfUpvotes - 1
    );
  
  SolutionState makeDownvote() =>
    _optional(
      newIsUpvoted: false,
      newIsDownvoted: true,
      newNumberOfUpvotes: isUpvoted ? numberOfUpvotes - 1 : numberOfUpvotes,
      newNumberOfDownvotes: numberOfDownvotes + 1
    );
  SolutionState removeDownvote() =>
    _optional(
      newIsDownvoted: false,
      newNumberOfDownvotes: numberOfDownvotes - 1
    );

  SolutionState markAsCorrect()
    => _optional(newState: SolutionStatus.correct);
  SolutionState markAsIncorrect()
    => _optional(newState: SolutionStatus.incorrect);  

  SolutionState save() => _optional(newIsSaved: true);
  SolutionState unsave() => _optional(newIsSaved: false);
}