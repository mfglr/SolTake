using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote
{
    public record MakeDownvoteDto(int SolutionId) : IRequest<MakeDownvoteResponseDto>;
}
