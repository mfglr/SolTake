using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveUpvote
{
    public record RemoveUpvoteDto(int SolutionId) : IRequest;
}
