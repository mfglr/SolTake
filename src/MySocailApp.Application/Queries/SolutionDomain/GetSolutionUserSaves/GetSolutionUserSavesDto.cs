using MediatR;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSavedSolutions
{
    public class GetSolutionUserSavesDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<SolutionUserSaveResponseDto>>;
}
