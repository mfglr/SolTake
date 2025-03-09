using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.RemoveDownvote
{
    public record RemoveDownvoteDto(int solutionId) : IRequest;
}
