using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveUpvote
{
    public record RemoveUpvoteDto(int SolutionId) : IRequest;
}
