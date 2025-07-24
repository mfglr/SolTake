using SolTake.Core;
using SolTake.Domain.QuestionAggregate.ValueObjects;

namespace SolTake.Application.Queries.QuestionDomain
{
    public record QuestionUserSaveResponseDto(int Id, int QuestionId, DateTime CreatedAt, DateTime? UpdatedAt, bool IsOwner, int UserId, string UserName, string? Content, bool IsLiked, bool IsSaved, QuestionPublishingState PublishingState, int NumberOfLikes, int NumberOfComments, int NumberOfSolutions, int NumberOfCorrectSolutions, int NumberOfVideoSolutions, QuestionExam Exam, QuestionSubject Subject, QuestionTopic? Topic, IEnumerable<Multimedia> Medias, Multimedia? Image);
}
