using MediatR;
using MySocailApp.Application.Queries.SolutionDomain;
using SolTake.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionsByQuestionId
{
    public record GetSolutionsByQuestionIdDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionResponseDto>>;
}
