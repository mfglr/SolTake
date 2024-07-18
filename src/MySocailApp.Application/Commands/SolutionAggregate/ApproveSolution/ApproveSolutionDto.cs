using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.ApproveSolution
{
    public record ApproveSolutionDto(int SolutionId) : IRequest;
}
