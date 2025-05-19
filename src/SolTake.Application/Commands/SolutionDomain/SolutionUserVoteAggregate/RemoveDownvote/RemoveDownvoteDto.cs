using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveDownvote
{
    public record RemoveDownvoteDto(int solutionId) : IRequest;
}
