using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.UnsaveSolution
{
    public record DeleteSolutionUserSaveDto(int SolutionId) : IRequest;
}
