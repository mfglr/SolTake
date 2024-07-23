using MediatR;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionImage
{
    public record GetSolutionImageDto(int SolutionId,string BlobName) : IRequest<byte[]>;
}
