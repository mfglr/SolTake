using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionUserSaveAggregate
{
    public record QuestionUserSaveResponseDto(int Id, QuestionResponseDto Question);
}
