using SolTake.Core;

namespace SolTake.Application.Queries.CommentAggregate
{
    public record CommentUserLikeResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
