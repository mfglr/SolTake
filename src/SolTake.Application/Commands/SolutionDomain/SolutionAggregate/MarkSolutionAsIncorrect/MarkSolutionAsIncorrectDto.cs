using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsIncorrect
{
    public record MarkSolutionAsIncorrectDto(int SolutionId) : IRequest;
}
