using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSavedSolutions
{
    public record GetSolutionUserSavesDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionUserSaveResponseDto>>;
}
