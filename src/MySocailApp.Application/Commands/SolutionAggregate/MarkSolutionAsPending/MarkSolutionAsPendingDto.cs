using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsPending
{
    public record MarkSolutionAsPendingDto(int SolutionId) : IRequest;
}
