using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.DeleteSolution
{
    public record DeleteSolutionDto(int SolutionId) : IRequest;
}
