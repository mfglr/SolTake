using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsCorrect
{
    public record MarkSolutionAsCorrectDto(int SolutionId) : IRequest;
}
