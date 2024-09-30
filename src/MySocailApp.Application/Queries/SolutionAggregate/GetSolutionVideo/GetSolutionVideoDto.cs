using MediatR;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionVideo
{
    public record GetSolutionVideoDto(int SolutionId) : IRequest<byte[]>;
}
