using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.Get
{
    public record GetQuestionsByUserIdDto(int UserId, int? LastId) : IRequest<List<QuestionResponseDto>>;
}
