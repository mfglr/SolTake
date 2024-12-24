using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public record SolutionResponseDto(int Id,DateTime CreatedAt,DateTime? UpdatedAt, int QuestionId,string UserName, int UserId, string? Content, bool IsUpvoted,int NumberOfUpvotes,bool IsDownvoted,int NumberOfDownvotes,int NumberOfComments,SolutionState State,bool IsOwner,bool IsSaved,bool DoesBelongToQuestionOfCurrentUser, IEnumerable<SolutionMediaResponseDto> Medias);
}
