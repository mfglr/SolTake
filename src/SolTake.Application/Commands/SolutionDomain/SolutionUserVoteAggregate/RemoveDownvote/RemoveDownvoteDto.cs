using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveDownvote
{
    public record RemoveDownvoteDto(int solutionId) : IRequest;
}
