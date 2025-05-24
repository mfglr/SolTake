using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SolutionDomain.GetIncorrectsSolutionsByQuestionId
{
    public record GetIncorrectSolutionsByQuestionIdDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionResponseDto>>;
}
