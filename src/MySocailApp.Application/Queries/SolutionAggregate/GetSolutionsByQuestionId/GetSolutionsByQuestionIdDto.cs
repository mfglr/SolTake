using MediatR;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId
{
    public record GetSolutionsByQuestionIdDto(int QuestionId,int? LastId) : IRequest<List<SolutionResponseDto>>;
}
