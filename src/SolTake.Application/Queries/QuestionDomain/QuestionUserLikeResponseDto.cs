using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain
{
    public record QuestionUserLikeResponseDto(int Id, int UserId,string UserName, string? Name, Multimedia? Image);
}
