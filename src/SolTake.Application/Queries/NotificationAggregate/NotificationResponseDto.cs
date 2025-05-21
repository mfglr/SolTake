using SolTake.Domain.NotificationDomain.NotificationAggregate.ValueObjects;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Core;

namespace MySocailApp.Application.Queries.NotificationAggregate
{
    public record NotificationResponseDto(int Id, DateTime CreatedAt, int OwnerId, NotificationType Type, bool IsViewed, int UserId, string UserName, Multimedia? Image, int? QuestionId, string? QuestionContent, Multimedia? QuestionMedia, int? CommentId, string? CommentContent, int? SolutionId, string? SolutionContent, Multimedia? SolutionMedia, int? RepliedId, string? RepliedContent, SolutionVoteType? SolutionVoteType);
}
