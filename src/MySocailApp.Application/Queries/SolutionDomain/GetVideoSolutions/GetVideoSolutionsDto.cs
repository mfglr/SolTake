using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetVideoSolutions
{
    public record GetVideoSolutionsDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionResponseDto>>;
}
