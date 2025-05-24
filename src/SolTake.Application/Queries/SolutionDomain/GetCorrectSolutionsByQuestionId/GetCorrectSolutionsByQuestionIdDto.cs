using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SolutionDomain.GetCorrectSolutionsByQuestionId
{
    public record GetCorrectSolutionsByQuestionIdDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionResponseDto>>;
}
