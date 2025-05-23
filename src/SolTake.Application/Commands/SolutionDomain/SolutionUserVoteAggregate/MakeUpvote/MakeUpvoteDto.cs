using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote
{
    public record MakeUpvoteDto(int SolutionId) : IRequest<MakeUpvoteResponseDto>;
}
