using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.UnsaveSolution
{
    public record DeleteSolutionUserSaveDto(int SolutionId) : IRequest;
}
