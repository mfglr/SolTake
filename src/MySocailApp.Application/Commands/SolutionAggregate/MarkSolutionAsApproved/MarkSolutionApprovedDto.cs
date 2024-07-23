using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.ApproveSolution
{
    public record MarkSolutionApprovedDto(int SolutionId) : IRequest;
}
