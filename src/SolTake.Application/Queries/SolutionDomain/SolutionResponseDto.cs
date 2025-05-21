using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Core;

namespace MySocailApp.Application.Queries.SolutionDomain
{
    public record SolutionResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, int QuestionId, string UserName, int UserId, string? Content, bool IsUpvoted, int NumberOfUpvotes, bool IsDownvoted, int NumberOfDownvotes, int NumberOfComments, SolutionState State, bool IsOwner, bool IsSaved, bool DoesBelongToQuestionOfCurrentUser, IEnumerable<Multimedia> Medias, Multimedia? Image, bool IsCreatedByAI, string? AiModelName, Multimedia? AiImage);
}
