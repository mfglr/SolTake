using MediatR;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionImage
{
    public record GetSolutionImageDto(int SolutionId,int SolutionImageId) : IRequest<Stream>;
}
