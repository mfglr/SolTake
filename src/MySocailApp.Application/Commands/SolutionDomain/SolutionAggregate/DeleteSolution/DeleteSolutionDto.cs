using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.DeleteSolution
{
    public record DeleteSolutionDto(int SolutionId) : IRequest;
}
