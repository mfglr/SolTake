using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSavedSolutions
{
    public class GetSavedSolutionsDto(int offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<SolutionUserSaveResponseDto>>;
}
