using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SolutionDomain.GetSolutionsByQuestionId
{
    public record GetSolutionsByQuestionIdDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionResponseDto>>;
}
