using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.Get
{
    public record GetQuestionsDto(int? LastId) : IRequest<List<QuestionResponseDto>>;
}
