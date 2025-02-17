using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate
{
    public record QuestionUserLikeResponseDto(int Id, DateTime CreatedAt, int QuestionId, int UserId, string? Name, string UserName, Multimedia? Image);
}
