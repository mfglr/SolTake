using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.DeleteSolution
{
    public record DeleteSolutionDto(int SolutionId) : IRequest;
}
